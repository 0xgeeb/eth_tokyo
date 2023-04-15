import React, { useEffect, useState } from "react"
import { ConnectButton } from "@rainbow-me/rainbowkit"
import Image from "next/image"
import popABI from "./abi/ProofofParticipation.json"
import popgmABI from "./abi/ProofofParticipationGoldMode.json"
import { useAccount, useContractEvent, usePrepareContractWrite, useContractWrite, useWaitForTransaction } from "wagmi"

export default function Home() {

  const [initialRender, setInitialRender] = useState<boolean>(false)
  const [goldToggle, setGoldToggle] = useState<boolean>(false)
  const [mintResult, setMintResult] = useState<number>(0)
  const [mintToggle, setMintToggle] = useState<boolean>(false)

  useEffect(() => {
    setInitialRender(true)
  }, [])

  const account = useAccount()

  useContractEvent({
    address: '0x05030aD041518441c4189978F8AcCa016a52b7be',
    abi: popABI.abi,
    eventName: 'NewNFT',
    listener(node: any) {
      console.log(parseInt(node._hex))
      setMintResult(parseInt(node._hex))
      setMintToggle(true)
    }
  })

  useContractEvent({
    address: '0x6966c4a38354D09cD4B95056DD4f5b3311837Fc3',
    abi: popABI.abi,
    eventName: 'NewNFT',
    listener(node: any) {
      console.log(parseInt(node._hex))
      setMintResult(parseInt(node._hex))
      setMintToggle(true)
    }
  })

  const { config: regularConfig } = usePrepareContractWrite({
    address: '0x05030aD041518441c4189978F8AcCa016a52b7be',
    abi: popABI.abi,
    functionName: 'mint',
    enabled: true
  })
  const { data: regularData, write: regularWrite } = useContractWrite(regularConfig)
  const { isLoading: regularIsLoading, isSuccess: regularIsSuccess } = useWaitForTransaction({
    hash: regularData?.hash
  })

  const { config: goldConfig } = usePrepareContractWrite({
    address: '0x6966c4a38354D09cD4B95056DD4f5b3311837Fc3',
    abi: popgmABI.abi,
    functionName: 'mint',
    enabled: true
  })
  const { data: goldData, write: goldWrite } = useContractWrite(goldConfig)
  const { isLoading: goldIsLoading, isSuccess: goldIsSuccess } = useWaitForTransaction({
    hash: goldData?.hash
  })

  function handleButtonClick() {
    setMintToggle(false)
    if(goldToggle) {
      goldWrite?.()
    }
    else {
      regularWrite?.()
    }
  }

  function handleMintResult() {
    if(mintResult == 0) {
      return <div id="result-container">
        <h1 id="result-title">congratz! you have minted a Celo PoP NFT</h1>
        <h2 id="result-subtitle">unfortunately you have not participated on Celo</h2>
        <Image id="result-image" src="/none_pop.png" alt="image" width="200" height="500"  />
      </div>
    }
    if(mintResult == 1 || mintResult == 2) {
      return <div id="result-container">
        <h1 id="result-title">congratz! you have minted a Celo PoP NFT</h1>
        <h2 id="result-subtitle">you have reached the bronze tier of participation on Celo!</h2>
        <Image id="result-image" src="/bronze_pop.png" alt="image" width="200" height="500"  />
      </div>
    }
    if(mintResult == 3 || mintResult == 4) {
      return <div id="result-container">
        <h1 id="result-title">congratz! you have minted a Celo PoP NFT</h1>
        <h2 id="result-subtitle">you have reached the silver tier of participation on Celo!</h2>
        <Image id="result-image" src="/silver_pop.png" alt="image" width="200" height="500"  />
      </div>
    }
    if(mintResult == 5 || mintResult == 6) {
      return <div id="result-container">
        <h1 id="result-title">congratz! you have minted a Celo PoP NFT</h1>
        <h2 id="result-subtitle">you have reached the gold tier of participation on Celo!</h2>
        <Image id="result-image" src="/gold_pop.png" alt="image" width="200" height="500"  />
      </div>
    }
  }

  if(!initialRender) {
    return null
  }
  else {
    return (
      <div id="container">
        <h1 id="title">Celo Proof of Participation</h1>
        {!account.address && <ConnectButton label="connect wallet" chainStatus="icon" showBalance={false} />}
        {account.address && <button id="button" onClick={() => handleButtonClick()}>Mint Celo PoP NFT</button>}
        { (regularIsLoading || goldIsLoading) &&  <div id="lds-hourglass"></div> }
        { mintToggle && handleMintResult() }
        <button id="gold" onClick={() => setGoldToggle((toggle) => !toggle)}>{goldToggle ? "disable gold mode" : "enable gold mode"}</button>
      </div>
    )
  }
}