<script setup lang="ts">
import { Button } from "@/components/ui/button";
import {
  ResizableHandle,
  ResizablePanel,
  ResizablePanelGroup,
} from "@/components/ui/resizable";
</script>

<template>
  <Button>hola</Button>
  <ResizablePanelGroup direction="horizontal">
    <ResizablePanel>One</ResizablePanel>
    <ResizableHandle with-handle />
    <ResizablePanel>Two</ResizablePanel>
  </ResizablePanelGroup>
</template>
