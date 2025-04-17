
## Custom rendering

Code:

```html
<a href="/examples/five"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Visit will be cancelled</a>

<script>
  const newspaperSpinningOut = [
    { transform: "rotate(0) scale(1)" },
    { transform: "rotate(360deg) scale(0)" },
  ];

  const newspaperSpinningIn = [
    { transform: "rotate(360deg) scale(0)" },
    { transform: "rotate(0) scale(1)" },
  ];

  const newspaperTiming = {
    duration: 2000,
    iterations: 1,
  };

  document.addEventListener("turbo:before-render", (event) => {
    event.detail.render = (currentElement, newElement) => {
      // animate out current body
      currentElement.animate(newspaperSpinningOut, newspaperTiming);
      setTimeout(function() {
        // remove body from page
        currentElement.remove()
      }, 2000);
      // add new body to page
      document.children[0].appendChild(newElement)
      newElement.animate(newspaperSpinningIn, newspaperTiming)
    }
  })
</script>
```

Example:

<a href="/turbo/canceling_visits"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Custom rendering</a>

<script>
  const newspaperSpinningOut = [
    { transform: "rotate(0) scale(1)" },
    { transform: "rotate(360deg) scale(0)" },
  ];

  const newspaperSpinningIn = [
    { transform: "rotate(360deg) scale(0)" },
    { transform: "rotate(0) scale(1)" },
  ];

  const newspaperTiming = {
    duration: 2000,
    iterations: 1,
  };

  document.addEventListener("turbo:before-render", (event) => {
    event.detail.render = (currentElement, newElement) => {
      // animate out current body
      currentElement.animate(newspaperSpinningOut, newspaperTiming);
      setTimeout(function() {
        // remove body from page
        currentElement.remove()
      }, 2000);
      // add new body to page
      document.children[0].appendChild(newElement)
      newElement.animate(newspaperSpinningIn, newspaperTiming)
    }
  })
</script>
