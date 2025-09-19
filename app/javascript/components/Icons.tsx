import cx from "classnames";
import * as React from "react";

export type IconName =
  | "default"
  | "fonts"
  | "h1"
  | "h2"
  | "file-arrow-down"
  | "file-music"
  | "file-play"
  | "file-text"
  | "outline-key"
  | "outline-cheveron-right"
  | "outline-cheveron-down"
  | "solid-check-circle"
  | "chevron-right"
  | "chevron-left"
  | "chevron-down"
  | "arrow-right"
  | "arrow-left"
  | "close"
  | "menu"
  | "search"
  | "user"
  | "settings"
  | "home"
  | "dashboard"
  | "products"
  | "orders"
  | "analytics"
  | "customers"
  | "affiliates"
  | "help"
  | "logout";

type IconProps = {
  name: IconName;
} & React.JSX.IntrinsicElements["span"];
export const Icon = ({ name, className, ...props }: IconProps) => (
  <span className={cx("icon", `icon-${name}`, className)} {...props} />
);
