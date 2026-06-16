export interface ChildProject {
  id: string | number;
  title: string;
  content: string;
  imageurl: string;
  type: string | number;
  ref_id: string | number;
}

export interface ParentProject {
  id: string | number;
  title: string;
  content: string;
  imageurl: string;
  type: string | number;
  ref_id: string | number | null;
  children: ChildProject[];
}

const PROJECTS_API_URL = import.meta.env.PUBLIC_PROJECTS_API_URL;

export async function fetchProjects(): Promise<ParentProject[]> {
  if (!PROJECTS_API_URL) {
    console.warn('fetchProjects: PUBLIC_PROJECTS_API_URL is not set');
    return [];
  }

  try {
    const response = await fetch(PROJECTS_API_URL);
    const result = await response.json();

    return result.data ?? [];
  } catch (err) {
    // If the API is unavailable during build (common locally), fallback to empty list
    console.warn('fetchProjects: failed to fetch projects, returning empty list', err);
    return [];
  }
}

export async function fetchChildProjects(): Promise<ChildProject[]> {
  const projects = await fetchProjects();

  return projects.flatMap((project) => project.children ?? []);
}

export async function fetchChildProjectById(id: string): Promise<ChildProject | undefined> {
  const children = await fetchChildProjects();

  return children.find((child) => String(child.id) === id);
}
