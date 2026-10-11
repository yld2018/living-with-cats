import fs from 'node:fs/promises';
import path from 'node:path';
const config=JSON.parse(await fs.readFile('book.json','utf8'));
const root=path.resolve(config.root);
const summary=await fs.readFile(path.join(root,'SUMMARY.md'),'utf8');
let count=0;
for(const match of summary.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
  const link=match[1];
  if (/^https?:/.test(link)) continue;
  const resolved=path.resolve(root,link.split('#')[0]);
  if (!resolved.startsWith(root+path.sep) && resolved!==root) throw Error('目录路径超出书稿文件夹：'+link);
  await fs.access(resolved);
  count++;
}
console.log('目录检查通过，共 '+count+' 个页面。');
