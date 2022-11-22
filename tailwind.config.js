/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,tpl}"],
  theme: {
    extend: {
      colors: {
        'multiDarkBlue': '#1C3879',
        'multiYellow': '#EA9F2E',
      },
      fontFamily: {
          'body': ['Montserrat', 'sans-serif']

      }
    }
  },
  plugins: [],
}
