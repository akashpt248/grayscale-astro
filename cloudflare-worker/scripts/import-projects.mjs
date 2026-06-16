import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';

function parseArgs(argv) {
  const args = {};

  for (let index = 2; index < argv.length; index += 1) {
    const token = argv[index];
    const nextToken = argv[index + 1];

    if (token === '--input') {
      args.input = nextToken;
      index += 1;
    } else if (token === '--output') {
      args.output = nextToken;
      index += 1;
    }
  }

  return args;
}

function sqlString(value) {
  if (value === null || value === undefined) {
    return 'NULL';
  }

  return `'${String(value).replace(/'/g, "''")}'`;
}

function toInsert(row) {
  return `(${[
    row.id,
    row.title,
    row.content,
    row.imageurl,
    row.type,
    row.ref_id,
    row.status ?? 1,
  ].map(sqlString).join(', ')})`;
}

async function main() {
  const { input, output } = parseArgs(process.argv);

  if (!input) {
    throw new Error('Usage: node import-projects.mjs --input legacy-projects.json [--output projects.seed.sql]');
  }

  const raw = await fs.readFile(input, 'utf8');
  const payload = JSON.parse(raw);
  const rows = Array.isArray(payload) ? payload : payload.data ?? [];

  if (!Array.isArray(rows)) {
    throw new Error('Input must be an array or a `{ data: [...] }` payload');
  }

  const statements = [
    'BEGIN TRANSACTION;',
    'DELETE FROM projects;',
  ];

  if (rows.length) {
    const values = rows.map(toInsert).join(',\n');

    statements.push(
      `INSERT INTO projects (id, title, content, imageurl, type, ref_id, status)\nVALUES\n${values};`,
    );
  }

  statements.push('COMMIT;');

  const outputPath = output
    ? path.resolve(output)
    : path.resolve(path.dirname(input), 'projects.seed.sql');

  await fs.writeFile(outputPath, `${statements.join('\n')}\n`);
  process.stdout.write(`Wrote ${outputPath}\n`);
}

main().catch((error) => {
  console.error(error.message);
  process.exit(1);
});
