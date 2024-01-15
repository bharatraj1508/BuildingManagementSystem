module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        "body-dark": "#232D3F",
        "body-light": "#F9F9F9",
        "body-card": "#EEEEEE",
        "body-navbar": "#7286D3",
        "nav-button": "#4A47A3",
      },
    },
  },
};
