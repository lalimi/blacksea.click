// Special i18n configuration for server-side rendering
// This avoids the "global is not defined" error during SSR

// Mock global object if it doesn't exist
if (typeof global === 'undefined') {
  globalThis.global = globalThis;
}

import i18n from "i18next";
import { initReactI18next } from "react-i18next";

// Import translation files directly for SSR (no HTTP requests)
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

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: "uk",
    fallbackLng: "uk",
    interpolation: {
      escapeValue: false
    },
    // Special settings for SSR
    react: {
      useSuspense: false
    }
  });

export default i18n;