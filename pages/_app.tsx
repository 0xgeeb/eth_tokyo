import { AppProps } from "next/app"
import Layout from "./components/Layout"
import Head from "next/head"
import { Acme } from "next/font/google"
import { configureChains, createClient, WagmiConfig } from "wagmi"
import { celoAlfajores } from "@wagmi/core/chains"
import { jsonRpcProvider } from "@wagmi/core/providers/jsonRpc"
import { connectorsForWallets, RainbowKitProvider } from "@rainbow-me/rainbowkit"
import { metaMaskWallet, injectedWallet, rainbowWallet, walletConnectWallet, ledgerWallet } from "@rainbow-me/rainbowkit/wallets"
import "@rainbow-me/rainbowkit/styles.css"
import "../styles/global.css"

const acme = Acme({
  weight: "400",
  subsets: ['latin']
})

function MyApp({ Component, pageProps }: AppProps) {


  const { chains, provider } = configureChains([celoAlfajores], [
    jsonRpcProvider({
      rpc: () => ({
        http: `https://celo-alfajores.infura.io/v3/622287366ca844bda84b6c9b8c4af49e`
      })
    })
  ])
  
  const connectors = connectorsForWallets([
    {
      groupName: "Proof of Participation",
      wallets: [
        metaMaskWallet({chains, shimDisconnect: true}),
        injectedWallet({ chains, shimDisconnect: true }),
        rainbowWallet({ chains }),
        walletConnectWallet({ chains }),
        ledgerWallet({ chains })
      ]
    }
  ])
  
  const wagmiClient = createClient({
    autoConnect: true,
    connectors,
    provider
  })

  return (
    <>
      <WagmiConfig client={wagmiClient}>
        <RainbowKitProvider chains={chains} coolMode>
          <Head>
            <title>Celo PoP</title>
          </Head>
          <Layout>
            <div className={acme.className}>
              <Component {...pageProps} />
            </div>
          </Layout> 
        </RainbowKitProvider>
      </WagmiConfig>
    </>
  )
}

export default MyApp