/**
 * Copyright (c) 2023, FatalMerlin
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

/**
 * Parses the OpenOS documentation and generates lua code.
 * Just paste it into the developer console in your browser on the desired page.
 * Example reference: https://ocdoc.cil.li/api:computer?s[]=computer
 */

/**
 * Extracts information from a code string and returns the processed data.
 *
 * @param {string} code - The code string to be processed.
 * @returns {string} The processed data extracted from the code string.
 */
function convert(code) {
    const match = code.match(/((?:\w*\.)?\w+)\((.*?)\)(?::(.*))?/);
    const name = match?.[1] ?? '';
    const args = match?.[2] ?? '';
    const ret = match?.[3] ?? '';

    const processedArgs = [
        ...args.matchAll(/(\[[,\s]+?)?(\w+):\s*([\w|\s]+)/g),
    ].map((arg) => ({
        name: arg[2],
        type: arg[3].replace('or', '|'),
        optional: !!arg[1],
    }));

    const processedRet = [
        ...ret.matchAll(/(\[[,\s]+?)?\s*((?:\w|\s|\.\.\.)+)/g),
    ].map((ret) => ({
        type: ret[2].replace('or', '|'),
        optional: !!ret[1],
    }));

    const params = processedArgs
        .map(
            (arg) =>
                `--- @param ${arg.name}${arg.optional ? '?' : ''} ${arg.type}\n`
        )
        .join('');
    let returnTypes = processedRet
        .map((ret) => ret.type + (ret.optional ? '?' : ''))
        .join(', ');
    if (returnTypes) returnTypes = `--- @return ${returnTypes}\n`;

    return `${params}${returnTypes}function ${name}(${processedArgs
        .map((arg) => arg.name)
        .join(', ')}) end`;
}

function copyToClipboard(content) {
    const textarea = document.createElement('textarea');
    textarea.value = content;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
}

function convertPage() {
    const result = [
        ...document.querySelectorAll('li.level1 > div.li > code:first-child'),
    ]
        .map((c) => {
            let fn = c.innerText;
            console.log(fn);
            let description = c.parentElement.innerText
                .replace(fn + '\n', '')
                .trim();

            return `${description
                .split('\n')
                .map((a) => `---${a.trim()}`)
                .join('\n')}\n${convert(fn)}`;
        })
        .join('\n\n');

    copyToClipboard(result);
}

convertPage();
