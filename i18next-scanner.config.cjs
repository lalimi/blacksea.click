module.exports = {
  input: [
    'app/javascript/**/*.{js,jsx,ts,tsx}',
    // Use ! to filter out files or directories
    '!app/javascript/locales/**',
    '!app/javascript/packs/**',
    '!**/node_modules/**',
  ],
  output: './',
  options: {
    debug: true,
    func: {
      list: ['i18next.t', 'i18n.t', 't'],
      extensions: ['.js', '.jsx', '.ts', '.tsx'],
    },
    trans: {
      component: 'Trans',
      i18nKey: 'i18nKey',
    },
    resource: {
      loadPath: 'app/javascript/locales/{{lng}}/{{ns}}.json',
      savePath: 'app/javascript/locales/{{lng}}/{{ns}}.json',
      jsonIndent: 2,
      lineEnding: '\n',
    },
    nsSeparator: false, // namespace separator
    keySeparator: false, // key separator
    interpolation: {
      prefix: '{{',
      suffix: '}}',
    },
  },
};
