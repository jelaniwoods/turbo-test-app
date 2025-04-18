# Displaying progress


default styles

```css
.turbo-progress-bar {
  position: fixed;
  display: block;
  top: 0;
  left: 0;
  height: 3px;
  background: #0076ff;
  z-index: 2147483647;
  transition:
    width 300ms ease-out,
    opacity 150ms 150ms ease-in;
  transform: translate3d(0, 0, 0);
}
```

---


<form
   action="/examples/three"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   data-turbo-frame="turbo-progress-green"
   >
  <input type="submit" value="Make progress bar green">
</form>

<turbo-frame id="turbo-progress-green"></turbo-frame>

Code

```css
.turbo-progress-bar {
  height: 5px;
  background-color: green;
}
```
  
<form
    action="/examples/three"
    method="get"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="get"
    data-turbo-frame="turbo-progress-hidden"
    >
  <input type="submit" value="Make progress bar hidden">
</form>
  
<turbo-frame id="turbo-progress-hidden"></turbo-frame>
