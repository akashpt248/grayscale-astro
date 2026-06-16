export interface StressItem {
  id: string;
  title: string;
  category: string;
  score: number;
  summary: string;
  accent: string;
}

const categories = [
  'Core Web Vitals',
  'Content Rendering',
  'Motion',
  'Data Fetching',
  'Media',
  'Hydration',
  'Navigation',
  'State',
];

const accents = ['indigo', 'teal', 'amber', 'rose', 'cyan', 'lime'];

const fragments = [
  'calibrated',
  'batched',
  'streamed',
  'hydrated',
  'virtualized',
  'debounced',
  'memoized',
  'aggregated',
  'deferred',
  'progressive',
];

function buildSummary(index: number, category: string) {
  const first = fragments[index % fragments.length];
  const second = fragments[(index + 3) % fragments.length];

  return `${first} ${category.toLowerCase()} entry with ${second} payloads and predictable render cost.`;
}

export function createStressItems(count: number, seed: string): StressItem[] {
  return Array.from({ length: count }, (_, index) => {
    const category = categories[(index + seed.length) % categories.length];
    const titleIndex = String(index + 1).padStart(3, '0');

    return {
      id: `${seed}-${titleIndex}`,
      title: `${seed.toUpperCase()} ${titleIndex}`,
      category,
      score: 100 - ((index * 7 + seed.length) % 53),
      summary: buildSummary(index, category),
      accent: accents[(index + seed.length) % accents.length],
    };
  });
}

