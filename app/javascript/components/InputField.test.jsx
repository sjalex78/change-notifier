import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
import React from "react";
import InputField from "./InputField";


describe("Input Field Validation", () => {
  it("renders", () => {
    render(<InputField path="path" value="value" name="name" type="type" id="id" />);
    const inputField = screen.getByTestId("id");
    expect(inputField).toBeInTheDocument();
    expect(inputField).toHaveAttribute("type", "type");
    expect(inputField).toHaveValue("value");
    expect(inputField).toHaveAttribute("name","name");
    expect(inputField).toHaveAttribute("id","id");
  });
})
