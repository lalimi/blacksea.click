module.exports = {
  createOldCatalogs: false,
  defaultNamespace: "translation",
  input: [
    "app/javascript/**/*.{js,jsx,ts,tsx}",
    "app/views/**/*.{erb,haml,slim}",
    "app/helpers/**/*.rb",
    "app/mailers/**/*.rb"
  ],
  lexers: {
    js: ["JavascriptLexer"],
    ts: ["TypescriptLexer"],
    jsx: ["JsxLexer"],
    tsx: ["TsxLexer"],
    default: ["JavascriptLexer"],
  },
  locales: ["uk", "en"],
  output: "public/locales/$LOCALE/$NAMESPACE.json",
  keySeparator: false,
  nsSeparator: false,
  sort: true,
  useKeysAsDefaultValue: true,
  verbose: true,
};
