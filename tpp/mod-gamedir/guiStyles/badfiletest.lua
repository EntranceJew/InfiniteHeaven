--mod\guiStyles\hurg.lua

local this={
	Alpha=1.000000,
	WindowPadding={8.000000,8.000000},
	WindowRounding=0.000000,
	WindowBorderSize=1.000000,
	WindowMinSize={32.000000,32.000000},
	WindowTitleAlign={0.000000,0.500000},
	WindowMenuButtonPosition=0,
	ChildRounding=0.000000,
	ChildBorderSize=1.000000,
	PopupRounding=0.000000,
	PopupBorderSize=1.000000x,
	FramePadding={4.000000,3.000000},
	FrameRounding=0.000000,
	FrameBorderSize=1.000000,
	ItemSpacing={8.000000,4.000000},
	ItemInnerSpacing={4.000000,4.000000},
	TouchExtraPadding={0.000000,0.000000},
	IndentSpacing=21.000000,
	ColumnsMinSpacing=6.000000,
	ScrollbarSize=14.000000,
	ScrollbarRounding=9.000000,
	GrabMinSize=20.000000,
	GrabRounding=0.000000,
	LogSliderDeadzone=4.000000,
	TabRounding=4.000000,
	TabBorderSize=1.000000,
	TabMinWidthForCloseButton=0.000000,
	ColorButtonPosition=1,
	ButtonTextAlign={0.500000,0.500000},
	SelectableTextAlign={0.000000,0.000000},
	DisplayWindowPadding={19.000000,19.000000},
	DisplaySafeAreaPadding={3.000000,3.000000},
	MouseCursorScale=1.000000,
	AntiAliasedLines=false,
	AntiAliasedLinesUseTex=true,
	AntiAliasedFill=true,
	CurveTessellationTol=1.250000,
	CircleSegmentMaxError=1.600000,
		ImGuiCol_Text={0.000000,0.000000,0.000000,1.000000},
		ImGuiCol_TextDisabled={0.600000,0.600000,0.600000,1.000000},
		ImGuiCol_WindowBg={0.940000,0.940000,0.940000,1.000000},
		ImGuiCol_ChildBg={0.000000,0.000000,0.000000,0.000000},
		ImGuiCol_PopupBg={1.000000,1.000000,1.000000,0.980000},
		ImGuiCol_Border={0.000000,0.000000,0.000000,0.300000},
		ImGuiCol_BorderShadow={0.000000,0.000000,0.000000,0.000000},
		ImGuiCol_FrameBg={1.000000,1.000000,1.000000,1.000000},
		ImGuiCol_FrameBgHovered={0.260000,0.590000,0.980000,0.400000},
		ImGuiCol_FrameBgActive={0.260000,0.590000,0.980000,0.670000},
		ImGuiCol_TitleBg={0.960000,0.960000,0.960000,1.000000},
		ImGuiCol_TitleBgActive={0.820000,0.820000,0.820000,1.000000},
		ImGuiCol_TitleBgCollapsed={1.000000,1.000000,1.000000,0.510000},
		ImGuiCol_MenuBarBg={0.860000,0.860000,0.860000,1.000000},
		ImGuiCol_ScrollbarBg={0.980000,0.980000,0.980000,0.530000},
		ImGuiCol_ScrollbarGrab={0.690000,0.690000,0.690000,0.800000},
		ImGuiCol_ScrollbarGrabHovered={0.490000,0.490000,0.490000,0.800000},
		ImGuiCol_ScrollbarGrabActive={0.490000,0.490000,0.490000,1.000000},
		ImGuiCol_CheckMark={0.260000,0.590000,0.980000,1.000000},
		ImGuiCol_SliderGrab={0.260000,0.590000,0.980000,0.780000},
		ImGuiCol_SliderGrabActive={0.460000,0.540000,0.800000,0.600000},
		ImGuiCol_Button={0.260000,0.590000,0.980000,0.400000},
		ImGuiCol_ButtonHovered={0.260000,0.590000,0.980000,1.000000},
		ImGuiCol_ButtonActive={0.060000,0.530000,0.980000,1.000000},
		ImGuiCol_Header={0.260000,0.590000,0.980000,0.310000},
		ImGuiCol_HeaderHovered={0.260000,0.590000,0.980000,0.800000},
		ImGuiCol_HeaderActive={0.260000,0.590000,0.980000,1.000000},
		ImGuiCol_Separator={0.390000,0.390000,0.390000,0.620000},
		ImGuiCol_SeparatorHovered={0.140000,0.440000,0.800000,0.780000},
		ImGuiCol_SeparatorActive={0.140000,0.440000,0.800000,1.000000},
		ImGuiCol_ResizeGrip={0.800000,0.800000,0.800000,0.560000},
		ImGuiCol_ResizeGripHovered={0.260000,0.590000,0.980000,0.670000},
		ImGuiCol_ResizeGripActive={0.260000,0.590000,0.980000,0.950000},
		ImGuiCol_Tab={0.764000,0.797000,0.836000,0.931000},
		ImGuiCol_TabHovered={0.260000,0.590000,0.980000,0.800000},
		ImGuiCol_TabActive={0.596000,0.728000,0.884000,1.000000},
		ImGuiCol_TabUnfocused={0.920800,0.927400,0.935200,0.986200},
		ImGuiCol_TabUnfocusedActive={0.741600,0.820800,0.914400,1.000000},
		ImGuiCol_PlotLines={0.390000,0.390000,0.390000,1.000000},
		ImGuiCol_PlotLinesHovered={1.000000,0.430000,0.350000,1.000000},
		ImGuiCol_PlotHistogram={0.900000,0.700000,0.000000,1.000000},
		ImGuiCol_PlotHistogramHovered={1.000000,0.450000,0.000000,1.000000},
		ImGuiCol_TextSelectedBg={0.260000,0.590000,0.980000,0.350000},
		ImGuiCol_DragDropTarget={0.260000,0.590000,0.980000,0.950000},
		ImGuiCol_NavHighlight={0.260000,0.590000,0.980000,0.800000},
		ImGuiCol_NavWindowingHighlight={0.700000,0.700000,0.700000,0.700000},
		ImGuiCol_NavWindowingDimBg={0.200000,0.200000,0.200000,0.200000},
		ImGuiCol_ModalWindowDimBg={0.200000,0.200000,0.200000,0.350000},
}
return this