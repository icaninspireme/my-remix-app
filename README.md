# Welcome to Remix!

This is the [Remix Tutorial](https://remix.run/docs/en/main/start/tutorial). 

I made the following extensions to it
- Added Docker Files to assist in deploying the container.
- Added a default avatar (nobody wants to see a broken image load).
- Added consistent application of id generation by applying toLocaleLowerCase to first name.


- [Remix Docs](https://remix.run/docs)


## Development

From your terminal:

```sh
npm run dev
```

This starts your app in development mode, rebuilding assets on file changes.

## Deployment

First, build your app for production:

```sh
npm run build
```

Then run the app in production mode:

```sh
npm start
```

Now you'll need to pick a host to deploy it to.

### DIY

Updated to deploy to Docker Desktop. Run the below command.

```sh
docker compose up
```

If you're familiar with deploying node applications, the built-in Remix app server is production-ready.

Make sure to deploy the output of `remix build`

- `build/server`
- `build/client`
