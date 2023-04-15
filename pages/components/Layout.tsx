import { LayoutProps } from "../../interfaces"

const Layout = ({ children }: LayoutProps) => (
  <div>
    {children}
    <div id="footer">2023 ethTokyo</div>
  </div>
)

export default Layout