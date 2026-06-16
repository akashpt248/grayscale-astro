import { createStressItems } from '../../lib/stressData';

export const prerender = true;

export function GET() {
  return new Response(
    JSON.stringify({
      collection: 'large',
      generatedAt: 'static',
      items: createStressItems(1200, 'large'),
    }),
    {
      headers: {
        'content-type': 'application/json; charset=utf-8',
        'cache-control': 'public, max-age=0, s-maxage=3600',
      },
    },
  );
}

