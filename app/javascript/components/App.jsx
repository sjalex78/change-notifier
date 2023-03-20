import React, {useState} from 'react'

function App() {
  const [count , setCount] = useState(0);
  return (
    <div className="w-full mt-8">
  <h2 className="text-2xl font-bold underline">Hello world! I am using React</h2>
  <div>
        <div className="max-w-sm rounded overflow-hidden">
          <div className="px-6 py-4">
            <div className="font-bold text-xl mb-2 list-none" >
              <p>You Clicked {count} times!!</p>
            </div>
            <button className="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded"
             onClick={() => setCount(count + 1)}>Click</button>
          </div>
        </div>
  </div>
  </div>
  );
}

export default App
