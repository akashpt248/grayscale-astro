DELETE FROM projects;

INSERT INTO projects (
  id,
  title,
  content,
  imageurl,
  type,
  ref_id,
  status,
  created_at,
  updated_at
) VALUES
(
  1,
  'Shoreline',
  'Grayscale is open source and MIT licensed. This means you can use it for any project - even commercial projects! Download it, customize it, and publish your website!',
  'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/bg-masthead.jpg',
  1,
  NULL,
  1,
  '2026-05-11 06:57:24',
  '2026-05-11 06:58:24'
),
(
  2,
  'Misty',
  'An example of where you can put an image of a project, or anything else, along with a description.',
  'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-01.jpg',
  2,
  1,
  1,
  '2026-05-11 06:57:24',
  '2026-05-11 06:58:24'
),
(
  3,
  'Mountains',
  'Another example of a project with its respective description. These sections work well responsively as well!',
  'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-02.jpg',
  2,
  1,
  1,
  '2026-05-11 06:57:24',
  '2026-05-11 06:58:24'
),
(
  4,
  'Mountains',
  'Another example of a project with its respective description. These sections work well responsively as well!',
  'https://startbootstrap.github.io/startbootstrap-grayscale/assets/img/demo-image-02.jpg',
  2,
  1,
  1,
  '2026-05-11 06:57:24',
  '2026-05-11 06:58:24'
);

