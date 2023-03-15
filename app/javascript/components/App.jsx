import React, {useState} from 'react'

function App() {
  const [count , setCount] = useState(0);
  return (
    <div>
      <p>You Clicked {count} times!!</p>
      <button onClick = {() => setCount(count +1)}>Click</button>
    </div>
  );
}

export default App
