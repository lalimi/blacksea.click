import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import HttpApi from 'i18next-http-backend';

import translationEN from '../../public/locales/en/translation.json';
import translationUK from '../../public/locales/uk/translation.json';

const resources = {
  en: {
    translation: translationEN
  },
  uk: {
    translation: translationUK
  }
};

console.log('i18n initialization - resources loaded:', resources);
console.log('i18n initialization - UK translations available:', resources.uk?.translation ? 'YES' : 'NO');

i18n
  .use(initReactI18next)
  .use(HttpApi)
  .init({
    resources,
    lng: "uk",
    fallbackLng: "en",
    debug: true, // Enable debug mode to see what's happening
    keySeparator: false,
    nsSeparator: false,
    returnEmptyString: false,
    returnNull: false,
    interpolation: {
      escapeValue: false
    },
    backend: {
      loadPath: '/locales/{{lng}}/{{ns}}.json'
    }
  })
  .then(() => {
    console.log('i18n initialized successfully with language:', i18n.language);
    console.log('i18n test translation "Welcome to Gumroad":', i18n.t("Welcome to Gumroad"));
  })
  .catch((error) => {
    console.error('i18n initialization failed:', error);
  });

export default i18n;
