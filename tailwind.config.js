/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,tpl}"],
  theme: {
    extend: {
      colors: {
        'multiDarkBlue': '#1C3879',
        'multiDarkYellow': '#e4a400',
        'multiDarkGray': '#6b7280',	
        'multiLightGray': '#d1d5db',
        'multiDanger': "#ef4444",
        "multiSuccess": "#10b981",
        "multiWarning": "#f59e0b",
      },
      fontFamily: {
          'body': ['Montserrat', 'sans-serif']

      }
    }
  },
  plugins: [],
}
