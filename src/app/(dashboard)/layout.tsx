import { NavSidebar } from "@/components/nav-sidebar/nav-sidebar"
import { SiteHeader } from "@/components/nav-sidebar/site-header"
import {
    SidebarInset,
    SidebarProvider,
} from "@/components/ui/sidebar"


export default function SidebarLayout({ children }: { children: React.ReactNode }) {
    return (
        <div className="[--header-height:calc(--spacing(14))]">
            <SidebarProvider className="flex flex-col">
                <SiteHeader />
                <div className="flex flex-1">
                    <NavSidebar />
                    <SidebarInset>
                        {children}
                    </SidebarInset>
                </div>
            </SidebarProvider>
        </div>
    )
}