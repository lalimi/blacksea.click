import * as React from "react";
import { useTranslation } from "react-i18next";

import { Button } from "$app/components/Button";
import { Icon } from "$app/components/Icons";
import { showAlert } from "$app/components/server-components/Alert";

export type MonobankConnect = {
  charge_processor_merchant_id: string | null;
  charge_processor_verified: boolean;
  supported_countries: string[];
  allow_monobank_connect: boolean;
  monobank_disconnect_allowed: boolean;
  has_connected_monobank: boolean;
  currency: string;
  display_name: string;
};

const MonobankConnectSection = ({
  monobankConnect,
  isFormDisabled,
  connectAccountFeeInfoText,
}: {
  monobankConnect: MonobankConnect;
  isFormDisabled: boolean;
  connectAccountFeeInfoText: string;
}) => {
  const { t } = useTranslation();
  const disconnectMonobank = () => {
    // TODO: Implement Monobank disconnect route
    showAlert(t("Monobank disconnect functionality will be implemented."), "info");
  };

  return (
    <section>
      <header>
        <h2>{monobankConnect.display_name}</h2>
        <a data-helper-prompt="How do I connect my Monobank account?">{t("Learn more")}</a>
      </header>
      <div className="paragraphs">
        {!monobankConnect.charge_processor_merchant_id ? (
          <>
            <p>
              {t("Connecting a Monobank account will allow you to accept payments in Ukraine. Each purchase made with Monobank will be deposited into your account immediately. Payments via Monobank are supported in {{countries}}.", { countries: monobankConnect.supported_countries.join(", ") })}
            </p>
            <p>{connectAccountFeeInfoText}</p>
            {monobankConnect.allow_monobank_connect ? (
              <div>
                <a
                  className="button button-monobank monobank-connect"
                  href="#"
                  inert={isFormDisabled}
                  onClick={(e) => {
                    e.preventDefault();
                    showAlert(t("Monobank integration will be available soon."), "info");
                  }}
                >
                  {t("Connect with Monobank")}
                </a>
              </div>
            ) : null}
          </>
        ) : monobankConnect.charge_processor_verified ? (
          <>
            <p>{connectAccountFeeInfoText}</p>
            <div style={{ display: "grid", gap: "var(--spacer-6)" }}>
              <fieldset>
                <legend>
                  <label>{t("Monobank account")}</label>
                </legend>
                <div className="input input-wrapper">
                  <div className="fake-input">{monobankConnect.charge_processor_merchant_id}</div>
                  <Icon name="solid-check-circle" style={{ color: "rgb(var(--success))" }} />
                </div>
              </fieldset>
              {monobankConnect.allow_monobank_connect ? (
                <>
                  <p>
                    <Button
                      color="danger"
                      className="button-monobank"
                      aria-label={t("Disconnect Monobank account")}
                      disabled={isFormDisabled || !monobankConnect.monobank_disconnect_allowed}
                      onClick={disconnectMonobank}
                    >
                      {t("Disconnect Monobank account")}
                    </Button>
                  </p>
                  {!monobankConnect.monobank_disconnect_allowed ? (
                    <div role="alert" className="warning">
                      {t("You cannot disconnect your Monobank account because it is being used for active subscription or preorder payments.")}
                    </div>
                  ) : null}
                </>
              ) : null}
            </div>
          </>
        ) : (
          <>
            <p>{connectAccountFeeInfoText}</p>
            {monobankConnect.allow_monobank_connect ? (
              <>
                <p>
                  <a
                    className="button button-monobank monobank-connect"
                    href="#"
                    inert={isFormDisabled}
                    onClick={(e) => {
                      e.preventDefault();
                      showAlert(t("Monobank integration will be available soon."), "info");
                    }}
                  >
                    {t("Connect with Monobank")}
                  </a>
                </p>
                <div role="alert" className="warning">
                  {t("Your Monobank account connection with Gumroad is incomplete. Please try connecting again.")}
                </div>
              </>
            ) : null}
          </>
        )}
      </div>
    </section>
  );
};
export default MonobankConnectSection;