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
            <a target="_blank" href={`${window.location.href}/${code}`}>{window.location.href}{code}</a>
          </div>
        </div>
    }
  </div>
}

export default App