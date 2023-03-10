module.exports = {
  
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/frontend/entrypoints/*.{js,ts,jsx,tsx}',
    './app/frontend/src/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        fancy: ["Sawarabi Mincho"],
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: { 
    themes: ["corporate"],
  },
}
