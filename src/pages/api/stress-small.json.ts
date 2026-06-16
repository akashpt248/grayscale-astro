import { createStressItems } from '../../lib/stressData';

export const prerender = true;

export function GET() {
  return new Response(
    JSON.stringify({
      collection: 'small',
      generatedAt: 'static',
      items: createStressItems(120, 'small'),
    }),
    {
      headers: {
        'content-type': 'application/json; charset=utf-8',
        'cache-control': 'public, max-age=0, s-maxage=3600',
      },
    },
  );
}

