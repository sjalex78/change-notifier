import React, { useState } from 'react'


export default function InputField({value, path, fieldName, type}) {
  const [inputValue, setInputValue ]= useState(value)
  const [isValid, setIsValid ]= useState(true)
  function handleChange(event) {
    console.log(event.target.value);
    setInputValue(event.target.value);
    fetch(`${path}?q=${event.target.value}`)
      .then((response) => response.json())
      .then((data) => {console.log(data);
      setIsValid(data["unique"])});
  }
  // add on state
  return (
    <div>
      <input
        data-testid={`${fieldName}-input`}
        value={inputValue}
        onChange={handleChange}
        type={type}
        className={`${
          isValid ? "focus:border-purple-500 " : "focus:border-red-500"
        } bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500`}
      />
    </div>
  );
}
