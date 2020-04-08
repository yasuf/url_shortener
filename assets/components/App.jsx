import React, { useState } from 'react'
import axios from 'axios'

import Loading from './Loading.jsx';

const App = () => {
  const [isCreatingUrl, setIsCreatingUrl] = useState(false);
  const [isUrlCreated, setIsUrlCreated] = useState(false);
  const [url, setUrl] = useState('');
  const [code, setCode] = useState(null);

  const onUrlChange = (event) => {
    setUrl(event.target.value);
  }
  
  const onSubmit = (e) => {
    e.preventDefault()
    setIsCreatingUrl(true)
    axios.post('/api/url', { url })
      .then((response) => {
        setIsCreatingUrl(false)
        setIsUrlCreated(true);
        setCode(response.data.code)
      })
  }

  debugger

  return <div className="shortener-app">
    <form onSubmit={onSubmit}>
      <label htmlFor="url">Enter a URL</label>
      <input name="url" type="text" onChange={onUrlChange} value={url}/>
      <input type="submit" />
    </form>
    {
      isCreatingUrl && <Loading />
    }
    {
      isUrlCreated && 
        <div className="notification">
          <div>
          Succesfully shortened URL:
          </div>
          <div>
            <a href={`localhost:4000/${code}`}>https://lynked.page/{code}</a>
          </div>
        </div>
    }
  </div>
}

export default App