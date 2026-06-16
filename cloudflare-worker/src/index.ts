export interface Env {
  DB: D1Database;
}

type ProjectRow = {
  id: number | string;
  title: string;
  content: string;
  imageurl: string;
  type: number | string;
  ref_id: number | string | null;
};

function buildProjects(rows: ProjectRow[]) {
  const parents: Record<string, ProjectRow & { children: ProjectRow[] }> = {};
  const children: ProjectRow[] = [];

  for (const row of rows) {
    if (String(row.type) === '1') {
      parents[String(row.id)] = { ...row, children: [] };
      continue;
    }

    if (String(row.type) === '2') {
      children.push(row);
    }
  }

  for (const child of children) {
    const parentId = String(child.ref_id ?? '');
    if (parents[parentId]) {
      parents[parentId].children.push(child);
    }
  }

  return Object.values(parents);
}

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);

    if (request.method === 'GET' && url.pathname === '/projects') {
      const { results } = await env.DB.prepare(
        'SELECT id, title, content, imageurl, type, ref_id FROM projects WHERE status = 1 ORDER BY id ASC',
      ).all<ProjectRow>();

      return Response.json({
        status: true,
        data: buildProjects(results ?? []),
      });
    }

    return Response.json(
      { status: false, message: 'Not found' },
      { status: 404 },
    );
  },
};
