const MarkdownIt = require('markdown-it')
const MarkdownParser = new MarkdownIt({
    html: true,
    breaks: true
});

export default {
    install: (app) => {
        app.directive('md', {
            mounted (el) {
              el.innerHTML = MarkdownParser.render(el.innerHTML)
            }
        })        
    }
}