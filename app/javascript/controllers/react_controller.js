import { Controller } from "@hotwired/stimulus";
import React from "react";
import { createRoot } from "react-dom/client";
import App from "../components/App";
import InputField from "../components/InputField";

// Connects to data-controller="react"
export default class extends Controller {
  connect(e) {
    const dataAttributes = {};
    Object.entries(this.element.attributes).forEach(
      ([, data]) => {
        dataAttributes[data.name.replace(/^data-/, "")] = data.value;
      }
    );
    console.log(dataAttributes);
    console.log("React controller connected!");
    if(dataAttributes['component'] == 'input') {
      createRoot(this.element).render(<InputField value={dataAttributes['value']} path={dataAttributes['path']} />);
    } else {
      const app = document.getElementById("app")
      createRoot(app).render(<App />);
    }

    // const inputField = document.getElementById("inputField")
    // createRoot(inputField).render(<InputField />);
  }
}
