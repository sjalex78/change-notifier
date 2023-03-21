import { Controller } from "@hotwired/stimulus";
import React from "react";
import { createRoot } from "react-dom/client";
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
      createRoot(this.element).render(<InputField
      value={dataAttributes['value']}
      path={dataAttributes['path']}
      type={dataAttributes['type']}
      name={dataAttributes['name']}
      id={dataAttributes['id']}
      />);
    }
  }
}
