import { getParams, htmlToResponse, readDir, readMarkdownFile } from "mastro";

export const GET = async (req) => {
  const { slug } = getParams(req.url);
  const post = await readMarkdownFile(`posts/${slug}.md`);
  return htmlToResponse(post.content);
}

export const getStaticPaths = async () => {
  const posts = await readDir("posts/");
  return posts.flatMap(p => p === ".DS_Store" ? [] : `/${p.slice(0, -3)}/`);
}
