const DOMNodeCollection = function (htmlElementsArray) {
    this.htmlElements = htmlElementsArray;
}

DOMNodeCollection.prototype.html = function (string) {
    if (string !== undefined) {
        this.htmlElements.forEach(function (htmlElement) {
            htmlElement.innerHTML = string;
        });
    }
    else {
        return this.htmlElements[0].innerHTML;
    }
}

DOMNodeCollection.prototype.empty = function () {
    this.html("");
}

DOMNodeCollection.prototype.append = function (arg) {
    if (arg instanceof DOMNodeCollection) {
        this.htmlElements.forEach(function (htmlElement) {
            htmlElement.innerHTML += arg.html();
        });
    }
    else if (arg instanceof HTMLElement) {
        this.htmlElements.forEach(function (htmlElement) {
            htmlElement.innerHTML += arg.outerHTML;
        });
    }
    else {
        // arg is a string
        this.htmlElements.forEach(function (htmlElement) {
            htmlElement.innerHTML += arg;
        });
    }
}

DOMNodeCollection.prototype.attr = function (attribute, value) {
    if (value === undefined) {

        for (let i = 0; i < this.htmlElements.length; i++) {
            if (this.htmlElements[i].hasAttribute(attribute)) {
                return this.htmlElements[i].getAttribute(attribute);
            }
        }
    }
    else {
        for (let i = 0; i < this.htmlElements.length; i++) {
            if (this.htmlElements[i].hasAttribute(attribute)) {
                this.htmlElements[i].setAttribute(attribute, value);
                return undefined;
            }
        }
    }
}

DOMNodeCollection.prototype.addClass = function (className) {
    this.htmlElements.forEach(function (htmlElement) {
        htmlElement.classList.add(className);
    });
}

DOMNodeCollection.prototype.removeClass = function (className) {
    this.htmlElements.forEach(function (htmlElement) {
        htmlElement.classList.remove(className);
    });
}

DOMNodeCollection.prototype.children = function () {
    let childs = [];
    this.htmlElements.forEach(function (htmlElement) {
        childs = childs.concat(Array.from(htmlElement.children))
    });
    return new DOMNodeCollection(childs);
}

module.exports = DOMNodeCollection;