module.exports = {
    apps: [
      {
        name: "astro-app",
        script: "npx astro dev",
        watch: false,
        env: {
          NODE_ENV: "development",
        },
      },
    ],
  };
  