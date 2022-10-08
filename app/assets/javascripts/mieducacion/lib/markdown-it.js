const MarkdownIt = require('markdown-it')
const MarkdownParser = new MarkdownIt({
    html: true,
    breaks: true
});

export default MarkdownParser

