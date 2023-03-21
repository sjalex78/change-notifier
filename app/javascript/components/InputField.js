import React, { useState } from 'react'


export default function InputField({value, path, fieldName, type}) {
  const [inputValue, setInputValue ]= useState(value)
  function handleChange(event) {
    console.log(event.target.value);
    setInputValue(event.target.value);
    fetch(`${path}?q=${event.target.value}`)
      .then((response) => response.json())
      .then((data) => console.log(data));
  }
  // add on state
  return (
    <div>
      <input
      data-testid={`${fieldName}-input`}
      value={inputValue}
      onChange={handleChange}
      type={type}
      />
    </div>
  );
}
