const { defineConfig } = require('cypress')

module.exports = defineConfig({
  screenshotsFolder: '/results/screenshots/',
  videosFolder: '/results/videos/',
  reporter: 'junit',
  reporterOptions: {
    mochaFile: '/results/cypress.xml',
    toConsole: true
  }
})
