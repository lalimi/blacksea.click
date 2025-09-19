const i18next = require('i18next');
    2 const Backend = require('i18next-fs-backend');
    3 const middleware = require('i18next-http-middleware');
    4
    5 const options = {
    6   lng: 'uk', // Set Ukrainian as default language
    7   fallbackLng: 'uk', // Мова, яка використовується як запасний варіант
    8   ns: ['translation'], // Простір імен
    9   defaultNS: 'translation', // Простір імен за замовчуванням
   10   backend: {
   11     loadPath: './public/locales/{{lng}}/{{ns}}.json', // Шлях до файлів
      перекладу
   12   },
   13 };
   14
   15 i18next
   16   .use(Backend)
   17   .use(middleware.LanguageDetector)
   18   .init(options);
   19
   20 module.exports = i18next;
