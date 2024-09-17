<script setup lang="ts">
import { Button } from "@/components/ui/button";
import {
  ResizableHandle,
  ResizablePanel,
  ResizablePanelGroup,
} from "@/components/ui/resizable";
import { TooltipProvider } from "@/components/ui/tooltip";
import { ref, defineProps } from "vue";
import { cn } from "@/lib/utils";
import { Separator } from "@/components/ui/separator";
import Nav, { type LinkProp } from "../components/Nav.vue";
import Search from "../components/Search.vue";
import TeamSwitcher from "../components/TeamSwitcher.vue";
import TopNav from "../components/TopNav.vue";
import UserNav from "../components/UserNav.vue";

interface NavProps {
  defaultLayout?: number[];
  defaultCollapsed?: boolean;
  navCollapsedSize: number;
}

const props = withDefaults(defineProps<NavProps>(), {
  defaultCollapsed: false,
  defaultLayout: () => [265, 440, 655],
});

const isCollapsed = ref(props.defaultCollapsed);

const links: LinkProp[] = [
  {
    title: "Inbox",
    label: "128",
    icon: "lucide:inbox",
    variant: "default",
  },
  {
    title: "Drafts",
    label: "9",
    icon: "lucide:file",
    variant: "ghost",
  },
  {
    title: "Sent",
    label: "",
    icon: "lucide:send",
    variant: "ghost",
  },
  {
    title: "Junk",
    label: "23",
    icon: "lucide:archive",
    variant: "ghost",
  },
  {
    title: "Trash",
    label: "",
    icon: "lucide:trash",
    variant: "ghost",
  },
  {
    title: "Archive",
    label: "",
    icon: "lucide:archive",
    variant: "ghost",
  },
];

function onCollapse() {
  isCollapsed.value = true;
}

function onExpand() {
  isCollapsed.value = false;
}
</script>

<template>
  <div class="border-b">
    <div class="flex h-16 items-center px-4">
      <TeamSwitcher />
      <TopNav class="mx-6" />
      <div class="ml-auto flex items-center space-x-4">
        <Search />
        <UserNav />
      </div>
    </div>
  </div>
  <TooltipProvider :delay-duration="0">
    <ResizablePanelGroup direction="horizontal">
      <ResizablePanel
        id="resize-panel-nav-1"
        :default-size="defaultLayout[0]"
        :collapsed-size="navCollapsedSize"
        collapsible
        :min-size="15"
        :max-size="20"
        :class="
          cn(
            isCollapsed &&
              'min-w-[50px] transition-all duration-300 ease-in-out',
          )
        "
        @expand="onExpand"
        @collapse="onCollapse"
      >
        <Separator />
        <Nav :is-collapsed="isCollapsed" :links="links" />
      </ResizablePanel>
      <ResizableHandle with-handle />
      <ResizablePanel>Two</ResizablePanel>
    </ResizablePanelGroup>
  </TooltipProvider>
</template>
