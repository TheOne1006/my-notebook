const glob = require("glob");
const { exec } = require("child_process");
const fs = require("fs");
const path = require("path");


/**
 * 生成配置
 */
const buildOps = [
  {
    source: "./stable-diffusion/*.md",
    target: "./stable-diffusion/html",
  },
];

function resetTarget(targetPath) {

    try {
        fs.statSync(targetPath);
    } catch (error) {
        fs.mkdirSync(targetPath);
    }

     fs.readdirSync(targetPath).forEach((file) => {
       const curPath = targetPath + "/" + file;
        fs.unlinkSync(curPath);
     });
}


function createMarkmap(source, targetPath) {
  // fs.removeSync(targetPath);
  resetTarget(targetPath);
  const files = glob.globSync(source);

  for (let i = 0; i < files.length; i++) {
    const filePath = files[i];

    const fileName = path.basename(filePath, ".md");
    const targetFile = `${targetPath}/${fileName}.html`;

    exec(
      `node_modules/.bin/markmap --no-open --output ${targetFile}  ${filePath} `,
      {},
      (error, stdout, stderr) => {
        if (error) {
          console.error(`执行出错: ${error}`);
          return;
        }
      }
    );
  }
}



for (let i = 0; i < buildOps.length; i++) {
  const { source, target } = buildOps[i];
  createMarkmap(source, target);

}
