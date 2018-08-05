# atjst

The *cleanest* JavaScript template you'll ever need.

## Usage

```javascript
const compile = require('atjst');
const render = compile('Hello @name!');
const output = render({ name: 'John' });
console.log(output); // => Hello John!
```

## Syntax

Subtitution:

```
Hello @name!
```

*Obviously* cleaner than `<%= name %>`, `{{ name }}` or `<name>`, isn't it?

---

Expression:

```
Hello @{ firstName + ' ' + lastName }!
```

Highly inspired by JavaScript template literal.

The curly brackets inside might be nested but they must be balanced.

However, it also recognizes JavaScript string, comment and regular expression literals.
Thus writing `@{ '}' }` or `@{ /}/ }` is perfectly fine.

---

Code:

```
@ for (let { name } of persons) {
  Hello @name!
@ }
```

At, space, *then* your code.

---

Comment:

```
@. This will be ignored.
```

---

Escape:

```
@@Override
```

Just in case.

## JavaScript API

```typescript
module.exports = (template: string) => (data: any) => string;
```

## Install

```
npm install atjst
```

## Build

```
npm run build
```
