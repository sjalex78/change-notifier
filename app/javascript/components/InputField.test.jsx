import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
import React from "react";
import InputField from "./InputField";


describe("Input Field Validation", () => {
  it("renders", () => {
    render(<InputField path="path" value="value" fieldName="fieldName" type="type" />);
    const inputField = screen.getByTestId("fieldName-input");
    expect(inputField).toBeInTheDocument();
    expect(inputField).toHaveAttribute("type", "type");
    expect(inputField).toHaveValue("value");
  });
})
