# Test Svelte + Docker

This creates a website with a dynamic e-mail list. It was built to try out [Svelte](https://svelte.dev/) and [Docker](https://www.docker.com/)

## TODO
- Improve or replace e-mail regex (non-valid: `l@l.de`,  `#@d.de`,  `/=§$ö@k.de`; valid: `A-Za-z0-9.!#$%&'*+-/=?^_``{|}~`)
- run docker container (`ERR_EMPTY_RESPONSE`, maybe link to main file index.html is missing)

## Possible improvements
- run docker with **ubuntu** and nginx, node
- check if e-mail already exists and add related hints
- add mailto-links
- show valid hint
- improve dark mode (replace white backgrounds)
- add some beautiful page background
- add imprint and github information/links

## Get started

Install the dependencies...

```bash
npm install
```

...then start [Rollup](https://rollupjs.org):

```bash
npm run dev
```

Navigate to [localhost:5000](http://localhost:5000). You should see your app running. 
By default, the server will only respond to requests from localhost. To allow connections from other computers, edit the `sirv` commands in package.json to include the option `--host 0.0.0.0`.

## Building and running in production mode

To create an optimized version of the app:

```bash
npm run build
```

You can run the newly built app with `npm run start`. This uses [sirv](https://github.com/lukeed/sirv), which is included in your package.json's `dependencies` so that the app will work when you deploy to platforms like [Heroku](https://heroku.com).

## Deploying to the web

### With [Docker](https://www.docker.com/)
```docker
docker build -t customName .
docker run -dp 5000:5000 customName
```