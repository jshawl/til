---
layout: post
---

Today I learned how to reflect text with `-webkit-box-reflect`:

<style>
  .reflect{
    -webkit-box-reflect: below 0 linear-gradient(transparent, white);
    text-transform:uppercase;
    text-align:center;
    font-weight:bold;
  }
</style>
<div class='reflect'>radical</div>

## 

---

```html
<div class='reflect'>radical</div>
```

```css
.reflect{
  -webkit-box-reflect: below 0 linear-gradient(transparent, white);
  text-transform:uppercase;
  text-align:center;
  font-weight:bold;
}
```
