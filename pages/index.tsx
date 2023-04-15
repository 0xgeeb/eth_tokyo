import React, { useEffect, useState } from "react"
import { ConnectButton } from "@rainbow-me/rainbowkit"
import Image from "next/image"
import { useAccount, usePrepareContractWrite, useContractWrite, useWaitForTransaction } from "wagmi"

export default function Home() {

  const [initialRender, setInitialRender] = useState<boolean>(false)

  useEffect(() => {
    setInitialRender(true)
  }, [])

  const account = useAccount()

  const { config } = usePrepareContractWrite({
    address: '',
    abi: [],
    functionName: 'mint',
    enabled: true
  })
  const { data, write } = useContractWrite(config)
  const { isLoading, isSuccess } = useWaitForTransaction({
    hash: data?.hash
  })


















  if(!initialRender) {
    return null
  }
  else {
    return (
      <div id="container">
        <h1 id="title">Celo Proof of Participation</h1>
        {!account.address && <ConnectButton label="connect wallet" chainStatus="icon" showBalance={false} />}
        {account.address && <button id="button" onClick={() => write?.()}>Mint Celo PoP NFT</button>}
      </div>
    )
  }
}