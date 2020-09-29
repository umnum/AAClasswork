const DOMNodeCollection = require('./dom_node_collection');

window.$l = function (selector) {
    if (selector instanceof HTMLElement) {
        return new DOMNodeCollection ([selector]);
    }
    let nodeList = document.querySelectorAll(selector);
    let arrayList = Array.from(nodeList);
    return new DOMNodeCollection (arrayList);
}