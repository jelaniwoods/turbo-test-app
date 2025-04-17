<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pausing request</a>

<script>
  const pauseFor5 = resolve => new Promise(resolve => setTimeout(resolve, 5000));

  document.addEventListener("turbo:before-fetch-request", async (event) => {
    event.preventDefault()
    console.log("pausing")
    await pauseFor5(console.log("gathering important data required for request"));
    console.log("resuming")

    event.detail.resume()
  })
</script>
