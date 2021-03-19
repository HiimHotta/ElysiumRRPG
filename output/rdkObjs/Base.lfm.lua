require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmElysium()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ficha_Elysium");
    obj:setTitle("Ficha Elysium");
    obj:setName("frmElysium");

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraFrenteLayout:setMinScaledWidth(300);
    obj.fraFrenteLayout:setVertAlign("leading");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout1:setVertAlign("leading");

    obj.flwNome1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwNome1:setParent(obj.flowLayout1);
    obj.flwNome1:setName("flwNome1");
    obj.flwNome1:setMinWidth(320);
    obj.flwNome1:setMaxWidth(1600);
    obj.flwNome1:setFrameStyle("frames/banner/dragon.xml");
    obj.flwNome1:setHeight(175);
    obj.flwNome1:setVertAlign("center");
    obj.flwNome1:setAvoidScale(true);
    obj.flwNome1:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layNomeHolderFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNomeHolderFrente:setParent(obj.flwNome1);
    obj.layNomeHolderFrente:setAlign("client");
    obj.layNomeHolderFrente:setName("layNomeHolderFrente");

    obj.edtNome1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome1:setParent(obj.layNomeHolderFrente);
    obj.edtNome1:setName("edtNome1");
    obj.edtNome1:setField("nome");
    obj.edtNome1:setFontSize(17);
    obj.edtNome1:setAlign("client");
    obj.edtNome1:setFontColor("white");
    obj.edtNome1:setVertTextAlign("center");
    obj.edtNome1:setTransparent(true);

    obj.labNome1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome1:setParent(obj.layNomeHolderFrente);
    obj.labNome1:setMargins({left=3});
    obj.labNome1:setName("labNome1");
    obj.labNome1:setAlign("bottom");
    obj.labNome1:setText("NOME DO PERSONAGEM");
    obj.labNome1:setAutoSize(true);
    obj.labNome1:setFontSize(12);
    obj.labNome1:setFontColor("#D0D0D0");

    obj.fraUpperGridFrente = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridFrente:setParent(obj.flowLayout1);
    obj.fraUpperGridFrente:setMinWidth(320);
    obj.fraUpperGridFrente:setMaxWidth(1600);
    obj.fraUpperGridFrente:setName("fraUpperGridFrente");
    obj.fraUpperGridFrente:setAvoidScale(true);
    obj.fraUpperGridFrente:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridFrente:setAutoHeight(true);
    obj.fraUpperGridFrente:setVertAlign("trailing");
    obj.fraUpperGridFrente:setMaxControlsPerLine(3);
    obj.fraUpperGridFrente:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");
    obj.UpperGridCampo1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo1:setVertAlign("leading");

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("classeENivel");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);
    obj.edtUpperGridCampo1:setFontColor("white");

    obj.linUpperGridCampo1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("CLASSE E NIVEL");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");
    obj.UpperGridCampo2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo2:setVertAlign("leading");

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("antecedentes");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);
    obj.edtUpperGridCampo2:setFontColor("white");

    obj.linUpperGridCampo2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("ANTECEDENTES");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");
    obj.UpperGridCampo3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo3:setVertAlign("leading");

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("nomeDoJogador");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);
    obj.edtUpperGridCampo3:setFontColor("white");

    obj.linUpperGridCampo3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("JOGADOR");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");
    obj.UpperGridCampo4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo4:setVertAlign("leading");

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("raca");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);
    obj.edtUpperGridCampo4:setFontColor("white");

    obj.linUpperGridCampo4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("RAÇA");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");
    obj.UpperGridCampo5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo5:setVertAlign("leading");

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("tendencia");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);
    obj.edtUpperGridCampo5:setFontColor("white");

    obj.linUpperGridCampo5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("TENDÊNCIA");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");
    obj.UpperGridCampo6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo6:setVertAlign("leading");

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("experiencia.valor");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);
    obj.edtUpperGridCampo6:setFontColor("white");

    obj.linUpperGridCampo6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("EXPERIÊNCIA");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayout);
    obj.flowLayout2:setHorzAlign("justify");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout2:setMinScaledWidth(300);
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout2);
    obj.flowPart1:setMinWidth(280);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setHeight(64);
    obj.flowPart1:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("inspiracao");
    obj.edit1:setWidth(65);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("client");
    obj.label1:setText("BONUS DE PROFICIÊNCIA");
    obj.label1:setMargins({left=10});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(280);
    obj.flowPart2:setMaxWidth(800);
    obj.flowPart2:setHeight(64);
    obj.flowPart2:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("left");
    obj.edit2:setField("bonusProficiencia");
    obj.edit2:setWidth(70);
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("client");
    obj.label2:setText("VISÃO NÍTIDA");
    obj.label2:setMargins({left=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(280);
    obj.flowPart3:setMaxWidth(800);
    obj.flowPart3:setHeight(64);
    obj.flowPart3:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("left");
    obj.edit3:setField("sabedoriaPassiva");
    obj.edit3:setWidth(70);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("client");
    obj.label3:setText("SABEDORIA PASSIVA (PERCEPÇÃO)");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(true);
    obj.label3:setMargins({left=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraFrenteLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.fraLayAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout3);
    obj.fraLayAtributos:setName("fraLayAtributos");
    obj.fraLayAtributos:setVertAlign("leading");
    obj.fraLayAtributos:setAutoHeight(true);
    obj.fraLayAtributos:setMinScaledWidth(290);
    obj.fraLayAtributos:setMaxControlsPerLine(3);
    obj.fraLayAtributos:setHorzAlign("center");
    obj.fraLayAtributos:setLineSpacing(10);
    obj.fraLayAtributos:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos:setAvoidScale(true);
    obj.fraLayAtributos:setStepSizes({310, 420, 640, 760, 1150});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.fraLayAtributos);
    obj.dataLink1:setField("atributos.destreza");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.fraLayAtributos);
    obj.flowPart4:setHeight(140);
    obj.flowPart4:setMinWidth(320);
    obj.flowPart4:setMaxWidth(420);
    obj.flowPart4:setMinScaledWidth(305);
    obj.flowPart4:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart4);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setAlign("top");
    obj.edit4:setMargins({left=30, right=30});
    obj.edit4:setField("atributos.destreza");
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(99);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setFrameRegion("modificador");
    obj.label4:setField("atributos.moddestrezastr");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontSize(46);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart4);
    obj.label5:setFrameRegion("titulo");
    obj.label5:setText("DESTREZA");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart4);
    obj.flowLayout4:setFrameRegion("RegiaoDePericias");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setLineSpacing(0);
    obj.flowLayout4:setHorzAlign("leading");
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setMinWidth(206);
    obj.flowPart5:setMaxWidth(250);
    obj.flowPart5:setHeight(17);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.flowPart5);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setMargins({});
    obj.imageCheckBox1:setField("resistencias.destreza");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart5);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(26);
    obj.layout2:setMargins({left=2});
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setField("resistencias.bonusdestrezastr");
    obj.label6:setAlign("client");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("trailing");
    obj.label6:setTextTrimming("none");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout2);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart5);
    obj.label7:setAlign("client");
    obj.label7:setText("Teste de Resistência");
    obj.label7:setVertTextAlign("trailing");
    obj.label7:setMargins({left=5});
    obj.label7:setAutoSize(true);
    obj.label7:setWordWrap(false);
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowLayout4);
    obj.dataLink2:setFields({'atributos.moddestreza', 'bonusProficiencia', 'resistencias.destreza'});
    obj.dataLink2:setName("dataLink2");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout4);
    obj.flowPart6:setMinWidth(206);
    obj.flowPart6:setMaxWidth(250);
    obj.flowPart6:setHeight(17);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.flowPart6);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setMargins({});
    obj.imageCheckBox2:setField("pericias.acrobacia");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart6);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(26);
    obj.layout3:setMargins({left=2});
    obj.layout3:setName("layout3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setField("pericias.bonusacrobaciastr");
    obj.label8:setAlign("client");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("trailing");
    obj.label8:setTextTrimming("none");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout3);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setName("horzLine2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart6);
    obj.label9:setAlign("client");
    obj.label9:setText("Acrobacia");
    obj.label9:setVertTextAlign("trailing");
    obj.label9:setMargins({left=5});
    obj.label9:setAutoSize(true);
    obj.label9:setWordWrap(false);
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowLayout4);
    obj.dataLink3:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.acrobacia'});
    obj.dataLink3:setName("dataLink3");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout4);
    obj.flowPart7:setMinWidth(206);
    obj.flowPart7:setMaxWidth(250);
    obj.flowPart7:setHeight(17);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.flowPart7);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setWidth(20);
    obj.imageCheckBox3:setMargins({});
    obj.imageCheckBox3:setField("pericias.furtividade");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart7);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(26);
    obj.layout4:setMargins({left=2});
    obj.layout4:setName("layout4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setField("pericias.bonusfurtividadestr");
    obj.label10:setAlign("client");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("trailing");
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout4);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setName("horzLine3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart7);
    obj.label11:setAlign("client");
    obj.label11:setText("Furtividade");
    obj.label11:setVertTextAlign("trailing");
    obj.label11:setMargins({left=5});
    obj.label11:setAutoSize(true);
    obj.label11:setWordWrap(false);
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout4);
    obj.dataLink4:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.furtividade'});
    obj.dataLink4:setName("dataLink4");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout4);
    obj.flowPart8:setMinWidth(206);
    obj.flowPart8:setMaxWidth(250);
    obj.flowPart8:setHeight(17);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.flowPart8);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setWidth(20);
    obj.imageCheckBox4:setMargins({});
    obj.imageCheckBox4:setField("pericias.prestidigitacao");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart8);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(26);
    obj.layout5:setMargins({left=2});
    obj.layout5:setName("layout5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setField("pericias.bonusprestidigitacaostr");
    obj.label12:setAlign("client");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("trailing");
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout5);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setName("horzLine4");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart8);
    obj.label13:setAlign("client");
    obj.label13:setText("Prestidigitação");
    obj.label13:setVertTextAlign("trailing");
    obj.label13:setMargins({left=5});
    obj.label13:setAutoSize(true);
    obj.label13:setWordWrap(false);
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout4);
    obj.dataLink5:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.prestidigitacao'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.fraLayAtributos);
    obj.dataLink6:setField("atributos.forca");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.fraLayAtributos);
    obj.flowPart9:setHeight(140);
    obj.flowPart9:setMinWidth(320);
    obj.flowPart9:setMaxWidth(420);
    obj.flowPart9:setMinScaledWidth(305);
    obj.flowPart9:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart9);
    obj.layout6:setLeft(6);
    obj.layout6:setTop(12);
    obj.layout6:setWidth(116);
    obj.layout6:setHeight(115);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setAlign("top");
    obj.edit5:setMargins({left=30, right=30});
    obj.edit5:setField("atributos.forca");
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(99);
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart9);
    obj.label14:setFrameRegion("modificador");
    obj.label14:setField("atributos.modforcastr");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("center");
    obj.label14:setFontSize(46);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart9);
    obj.label15:setFrameRegion("titulo");
    obj.label15:setText("FORÇA");
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart9);
    obj.flowLayout5:setFrameRegion("RegiaoDePericias");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setLineSpacing(0);
    obj.flowLayout5:setHorzAlign("leading");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout5);
    obj.flowPart10:setMinWidth(206);
    obj.flowPart10:setMaxWidth(250);
    obj.flowPart10:setHeight(17);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.flowPart10);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setWidth(20);
    obj.imageCheckBox5:setMargins({});
    obj.imageCheckBox5:setField("resistencias.forca");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart10);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(26);
    obj.layout7:setMargins({left=2});
    obj.layout7:setName("layout7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout7);
    obj.label16:setField("resistencias.bonusforcastr");
    obj.label16:setAlign("client");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("trailing");
    obj.label16:setTextTrimming("none");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout7);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setAlign("bottom");
    obj.horzLine5:setName("horzLine5");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart10);
    obj.label17:setAlign("client");
    obj.label17:setText("Teste de Resistência");
    obj.label17:setVertTextAlign("trailing");
    obj.label17:setMargins({left=5});
    obj.label17:setAutoSize(true);
    obj.label17:setWordWrap(false);
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout5);
    obj.dataLink7:setFields({'atributos.modforca', 'bonusProficiencia', 'resistencias.forca'});
    obj.dataLink7:setName("dataLink7");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout5);
    obj.flowPart11:setMinWidth(206);
    obj.flowPart11:setMaxWidth(250);
    obj.flowPart11:setHeight(17);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.flowPart11);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setWidth(20);
    obj.imageCheckBox6:setMargins({});
    obj.imageCheckBox6:setField("pericias.atletismo");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart11);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(26);
    obj.layout8:setMargins({left=2});
    obj.layout8:setName("layout8");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout8);
    obj.label18:setField("pericias.bonusatletismostr");
    obj.label18:setAlign("client");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("trailing");
    obj.label18:setTextTrimming("none");
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout8);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setAlign("bottom");
    obj.horzLine6:setName("horzLine6");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart11);
    obj.label19:setAlign("client");
    obj.label19:setText("Atletismo");
    obj.label19:setVertTextAlign("trailing");
    obj.label19:setMargins({left=5});
    obj.label19:setAutoSize(true);
    obj.label19:setWordWrap(false);
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout5);
    obj.dataLink8:setFields({'atributos.modforca', 'bonusProficiencia', 'pericias.atletismo'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.fraLayAtributos);
    obj.dataLink9:setField("atributos.constituicao");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.fraLayAtributos);
    obj.flowPart12:setHeight(140);
    obj.flowPart12:setMinWidth(320);
    obj.flowPart12:setMaxWidth(420);
    obj.flowPart12:setMinScaledWidth(305);
    obj.flowPart12:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart12);
    obj.layout9:setLeft(6);
    obj.layout9:setTop(12);
    obj.layout9:setWidth(116);
    obj.layout9:setHeight(115);
    obj.layout9:setName("layout9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setAlign("top");
    obj.edit6:setMargins({left=30, right=30});
    obj.edit6:setField("atributos.constituicao");
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setMax(99);
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart12);
    obj.label20:setFrameRegion("modificador");
    obj.label20:setField("atributos.modconstituicaostr");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("center");
    obj.label20:setFontSize(46);
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart12);
    obj.label21:setFrameRegion("titulo");
    obj.label21:setText("CONSTITUIÇÃO");
    obj.label21:setVertTextAlign("center");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart12);
    obj.flowLayout6:setFrameRegion("RegiaoDePericias");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setLineSpacing(0);
    obj.flowLayout6:setHorzAlign("leading");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout6);
    obj.flowPart13:setMinWidth(206);
    obj.flowPart13:setMaxWidth(250);
    obj.flowPart13:setHeight(17);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.flowPart13);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setWidth(20);
    obj.imageCheckBox7:setMargins({});
    obj.imageCheckBox7:setField("resistencias.constituicao");
    obj.imageCheckBox7:setOptimize(false);
    obj.imageCheckBox7:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox7:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox7:setName("imageCheckBox7");
    obj.imageCheckBox7:setHeight(20);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart13);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(26);
    obj.layout10:setMargins({left=2});
    obj.layout10:setName("layout10");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout10);
    obj.label22:setField("resistencias.bonusconstituicaostr");
    obj.label22:setAlign("client");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("trailing");
    obj.label22:setTextTrimming("none");
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout10);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setAlign("bottom");
    obj.horzLine7:setName("horzLine7");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart13);
    obj.label23:setAlign("client");
    obj.label23:setText("Teste de Resistência");
    obj.label23:setVertTextAlign("trailing");
    obj.label23:setMargins({left=5});
    obj.label23:setAutoSize(true);
    obj.label23:setWordWrap(false);
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowLayout6);
    obj.dataLink10:setFields({'atributos.modconstituicao', 'bonusProficiencia', 'resistencias.constituicao'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.fraLayAtributos);
    obj.dataLink11:setField("atributos.carisma");
    obj.dataLink11:setName("dataLink11");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.fraLayAtributos);
    obj.flowPart14:setHeight(140);
    obj.flowPart14:setMinWidth(320);
    obj.flowPart14:setMaxWidth(420);
    obj.flowPart14:setMinScaledWidth(305);
    obj.flowPart14:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart14);
    obj.layout11:setLeft(6);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(116);
    obj.layout11:setHeight(115);
    obj.layout11:setName("layout11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout11);
    obj.edit7:setAlign("top");
    obj.edit7:setMargins({left=30, right=30});
    obj.edit7:setField("atributos.carisma");
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(99);
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart14);
    obj.label24:setFrameRegion("modificador");
    obj.label24:setField("atributos.modcarismastr");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("center");
    obj.label24:setFontSize(46);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart14);
    obj.label25:setFrameRegion("titulo");
    obj.label25:setText("AGILIDADE");
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart14);
    obj.flowLayout7:setFrameRegion("RegiaoDePericias");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setLineSpacing(0);
    obj.flowLayout7:setHorzAlign("leading");
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout7:setVertAlign("leading");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout7);
    obj.flowPart15:setMinWidth(206);
    obj.flowPart15:setMaxWidth(250);
    obj.flowPart15:setHeight(17);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.flowPart15);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setWidth(20);
    obj.imageCheckBox8:setMargins({});
    obj.imageCheckBox8:setField("resistencias.carisma");
    obj.imageCheckBox8:setOptimize(false);
    obj.imageCheckBox8:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox8:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox8:setName("imageCheckBox8");
    obj.imageCheckBox8:setHeight(20);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart15);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(26);
    obj.layout12:setMargins({left=2});
    obj.layout12:setName("layout12");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout12);
    obj.label26:setField("resistencias.bonuscarismastr");
    obj.label26:setAlign("client");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setVertTextAlign("trailing");
    obj.label26:setTextTrimming("none");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout12);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setAlign("bottom");
    obj.horzLine8:setName("horzLine8");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart15);
    obj.label27:setAlign("client");
    obj.label27:setText("Teste de Resistência");
    obj.label27:setVertTextAlign("trailing");
    obj.label27:setMargins({left=5});
    obj.label27:setAutoSize(true);
    obj.label27:setWordWrap(false);
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowLayout7);
    obj.dataLink12:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma'});
    obj.dataLink12:setName("dataLink12");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout7);
    obj.flowPart16:setMinWidth(206);
    obj.flowPart16:setMaxWidth(250);
    obj.flowPart16:setHeight(17);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.flowPart16);
    obj.imageCheckBox9:setAlign("left");
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setMargins({});
    obj.imageCheckBox9:setField("pericias.atuacao");
    obj.imageCheckBox9:setOptimize(false);
    obj.imageCheckBox9:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox9:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox9:setName("imageCheckBox9");
    obj.imageCheckBox9:setHeight(20);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart16);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(26);
    obj.layout13:setMargins({left=2});
    obj.layout13:setName("layout13");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout13);
    obj.label28:setField("pericias.bonusatuacaostr");
    obj.label28:setAlign("client");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setVertTextAlign("trailing");
    obj.label28:setTextTrimming("none");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout13);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setAlign("bottom");
    obj.horzLine9:setName("horzLine9");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart16);
    obj.label29:setAlign("client");
    obj.label29:setText("Atuação");
    obj.label29:setVertTextAlign("trailing");
    obj.label29:setMargins({left=5});
    obj.label29:setAutoSize(true);
    obj.label29:setWordWrap(false);
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowLayout7);
    obj.dataLink13:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao'});
    obj.dataLink13:setName("dataLink13");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout7);
    obj.flowPart17:setMinWidth(206);
    obj.flowPart17:setMaxWidth(250);
    obj.flowPart17:setHeight(17);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.flowPart17);
    obj.imageCheckBox10:setAlign("left");
    obj.imageCheckBox10:setWidth(20);
    obj.imageCheckBox10:setMargins({});
    obj.imageCheckBox10:setField("pericias.enganacao");
    obj.imageCheckBox10:setOptimize(false);
    obj.imageCheckBox10:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox10:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox10:setName("imageCheckBox10");
    obj.imageCheckBox10:setHeight(20);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart17);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(26);
    obj.layout14:setMargins({left=2});
    obj.layout14:setName("layout14");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout14);
    obj.label30:setField("pericias.bonusenganacaostr");
    obj.label30:setAlign("client");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setVertTextAlign("trailing");
    obj.label30:setTextTrimming("none");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout14);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setName("horzLine10");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart17);
    obj.label31:setAlign("client");
    obj.label31:setText("Enganação");
    obj.label31:setVertTextAlign("trailing");
    obj.label31:setMargins({left=5});
    obj.label31:setAutoSize(true);
    obj.label31:setWordWrap(false);
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowLayout7);
    obj.dataLink14:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao'});
    obj.dataLink14:setName("dataLink14");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout7);
    obj.flowPart18:setMinWidth(206);
    obj.flowPart18:setMaxWidth(250);
    obj.flowPart18:setHeight(17);
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart18:setVertAlign("leading");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.flowPart18);
    obj.imageCheckBox11:setAlign("left");
    obj.imageCheckBox11:setWidth(20);
    obj.imageCheckBox11:setMargins({});
    obj.imageCheckBox11:setField("pericias.intimidacao");
    obj.imageCheckBox11:setOptimize(false);
    obj.imageCheckBox11:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox11:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox11:setName("imageCheckBox11");
    obj.imageCheckBox11:setHeight(20);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart18);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(26);
    obj.layout15:setMargins({left=2});
    obj.layout15:setName("layout15");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout15);
    obj.label32:setField("pericias.bonusintimidacaostr");
    obj.label32:setAlign("client");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setVertTextAlign("trailing");
    obj.label32:setTextTrimming("none");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout15);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setName("horzLine11");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart18);
    obj.label33:setAlign("client");
    obj.label33:setText("Intimidação");
    obj.label33:setVertTextAlign("trailing");
    obj.label33:setMargins({left=5});
    obj.label33:setAutoSize(true);
    obj.label33:setWordWrap(false);
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowLayout7);
    obj.dataLink15:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao'});
    obj.dataLink15:setName("dataLink15");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout7);
    obj.flowPart19:setMinWidth(206);
    obj.flowPart19:setMaxWidth(250);
    obj.flowPart19:setHeight(17);
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart19:setVertAlign("leading");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.flowPart19);
    obj.imageCheckBox12:setAlign("left");
    obj.imageCheckBox12:setWidth(20);
    obj.imageCheckBox12:setMargins({});
    obj.imageCheckBox12:setField("pericias.persuasao");
    obj.imageCheckBox12:setOptimize(false);
    obj.imageCheckBox12:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox12:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox12:setName("imageCheckBox12");
    obj.imageCheckBox12:setHeight(20);

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart19);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=2});
    obj.layout16:setName("layout16");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout16);
    obj.label34:setField("pericias.bonuspersuasaostr");
    obj.label34:setAlign("client");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("trailing");
    obj.label34:setTextTrimming("none");
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout16);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setName("horzLine12");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart19);
    obj.label35:setAlign("client");
    obj.label35:setText("Persuasão");
    obj.label35:setVertTextAlign("trailing");
    obj.label35:setMargins({left=5});
    obj.label35:setAutoSize(true);
    obj.label35:setWordWrap(false);
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.flowLayout7);
    obj.dataLink16:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.fraLayAtributos);
    obj.dataLink17:setField("atributos.inteligencia");
    obj.dataLink17:setName("dataLink17");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.fraLayAtributos);
    obj.flowPart20:setHeight(140);
    obj.flowPart20:setMinWidth(320);
    obj.flowPart20:setMaxWidth(420);
    obj.flowPart20:setMinScaledWidth(305);
    obj.flowPart20:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart20:setVertAlign("leading");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart20);
    obj.layout17:setLeft(6);
    obj.layout17:setTop(12);
    obj.layout17:setWidth(116);
    obj.layout17:setHeight(115);
    obj.layout17:setName("layout17");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout17);
    obj.edit8:setAlign("top");
    obj.edit8:setMargins({left=30, right=30});
    obj.edit8:setField("atributos.inteligencia");
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(99);
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart20);
    obj.label36:setFrameRegion("modificador");
    obj.label36:setField("atributos.modinteligenciastr");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setVertTextAlign("center");
    obj.label36:setFontSize(46);
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart20);
    obj.label37:setFrameRegion("titulo");
    obj.label37:setText("INTELIGÊNCIA");
    obj.label37:setVertTextAlign("center");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart20);
    obj.flowLayout8:setFrameRegion("RegiaoDePericias");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(0);
    obj.flowLayout8:setHorzAlign("leading");
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout8);
    obj.flowPart21:setMinWidth(206);
    obj.flowPart21:setMaxWidth(250);
    obj.flowPart21:setHeight(17);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart21:setVertAlign("leading");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.flowPart21);
    obj.imageCheckBox13:setAlign("left");
    obj.imageCheckBox13:setWidth(20);
    obj.imageCheckBox13:setMargins({});
    obj.imageCheckBox13:setField("resistencias.inteligencia");
    obj.imageCheckBox13:setOptimize(false);
    obj.imageCheckBox13:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox13:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox13:setName("imageCheckBox13");
    obj.imageCheckBox13:setHeight(20);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart21);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(26);
    obj.layout18:setMargins({left=2});
    obj.layout18:setName("layout18");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout18);
    obj.label38:setField("resistencias.bonusinteligenciastr");
    obj.label38:setAlign("client");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setVertTextAlign("trailing");
    obj.label38:setTextTrimming("none");
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout18);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setName("horzLine13");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart21);
    obj.label39:setAlign("client");
    obj.label39:setText("Teste de Resistência");
    obj.label39:setVertTextAlign("trailing");
    obj.label39:setMargins({left=5});
    obj.label39:setAutoSize(true);
    obj.label39:setWordWrap(false);
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flowLayout8);
    obj.dataLink18:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'resistencias.inteligencia'});
    obj.dataLink18:setName("dataLink18");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout8);
    obj.flowPart22:setMinWidth(206);
    obj.flowPart22:setMaxWidth(250);
    obj.flowPart22:setHeight(17);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.flowPart22);
    obj.imageCheckBox14:setAlign("left");
    obj.imageCheckBox14:setWidth(20);
    obj.imageCheckBox14:setMargins({});
    obj.imageCheckBox14:setField("pericias.arcanismo");
    obj.imageCheckBox14:setOptimize(false);
    obj.imageCheckBox14:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox14:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox14:setName("imageCheckBox14");
    obj.imageCheckBox14:setHeight(20);

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart22);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(26);
    obj.layout19:setMargins({left=2});
    obj.layout19:setName("layout19");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout19);
    obj.label40:setField("pericias.bonusarcanismostr");
    obj.label40:setAlign("client");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("trailing");
    obj.label40:setTextTrimming("none");
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout19);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setAlign("bottom");
    obj.horzLine14:setName("horzLine14");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart22);
    obj.label41:setAlign("client");
    obj.label41:setText("Arcanismo");
    obj.label41:setVertTextAlign("trailing");
    obj.label41:setMargins({left=5});
    obj.label41:setAutoSize(true);
    obj.label41:setWordWrap(false);
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowLayout8);
    obj.dataLink19:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.arcanismo'});
    obj.dataLink19:setName("dataLink19");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout8);
    obj.flowPart23:setMinWidth(206);
    obj.flowPart23:setMaxWidth(250);
    obj.flowPart23:setHeight(17);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.flowPart23);
    obj.imageCheckBox15:setAlign("left");
    obj.imageCheckBox15:setWidth(20);
    obj.imageCheckBox15:setMargins({});
    obj.imageCheckBox15:setField("pericias.historia");
    obj.imageCheckBox15:setOptimize(false);
    obj.imageCheckBox15:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox15:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox15:setName("imageCheckBox15");
    obj.imageCheckBox15:setHeight(20);

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart23);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(26);
    obj.layout20:setMargins({left=2});
    obj.layout20:setName("layout20");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout20);
    obj.label42:setField("pericias.bonushistoriastr");
    obj.label42:setAlign("client");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("trailing");
    obj.label42:setTextTrimming("none");
    obj.label42:setName("label42");
    obj.label42:setFontColor("white");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout20);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setAlign("bottom");
    obj.horzLine15:setName("horzLine15");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart23);
    obj.label43:setAlign("client");
    obj.label43:setText("História");
    obj.label43:setVertTextAlign("trailing");
    obj.label43:setMargins({left=5});
    obj.label43:setAutoSize(true);
    obj.label43:setWordWrap(false);
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowLayout8);
    obj.dataLink20:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.historia'});
    obj.dataLink20:setName("dataLink20");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout8);
    obj.flowPart24:setMinWidth(206);
    obj.flowPart24:setMaxWidth(250);
    obj.flowPart24:setHeight(17);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.flowPart24);
    obj.imageCheckBox16:setAlign("left");
    obj.imageCheckBox16:setWidth(20);
    obj.imageCheckBox16:setMargins({});
    obj.imageCheckBox16:setField("pericias.investigacao");
    obj.imageCheckBox16:setOptimize(false);
    obj.imageCheckBox16:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox16:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox16:setName("imageCheckBox16");
    obj.imageCheckBox16:setHeight(20);

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart24);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(26);
    obj.layout21:setMargins({left=2});
    obj.layout21:setName("layout21");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout21);
    obj.label44:setField("pericias.bonusinvestigacaostr");
    obj.label44:setAlign("client");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("trailing");
    obj.label44:setTextTrimming("none");
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout21);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setAlign("bottom");
    obj.horzLine16:setName("horzLine16");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart24);
    obj.label45:setAlign("client");
    obj.label45:setText("Investigação");
    obj.label45:setVertTextAlign("trailing");
    obj.label45:setMargins({left=5});
    obj.label45:setAutoSize(true);
    obj.label45:setWordWrap(false);
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.flowLayout8);
    obj.dataLink21:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.investigacao'});
    obj.dataLink21:setName("dataLink21");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout8);
    obj.flowPart25:setMinWidth(206);
    obj.flowPart25:setMaxWidth(250);
    obj.flowPart25:setHeight(17);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.flowPart25);
    obj.imageCheckBox17:setAlign("left");
    obj.imageCheckBox17:setWidth(20);
    obj.imageCheckBox17:setMargins({});
    obj.imageCheckBox17:setField("pericias.natureza");
    obj.imageCheckBox17:setOptimize(false);
    obj.imageCheckBox17:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox17:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox17:setName("imageCheckBox17");
    obj.imageCheckBox17:setHeight(20);

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart25);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(26);
    obj.layout22:setMargins({left=2});
    obj.layout22:setName("layout22");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout22);
    obj.label46:setField("pericias.bonusnaturezastr");
    obj.label46:setAlign("client");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("trailing");
    obj.label46:setTextTrimming("none");
    obj.label46:setName("label46");
    obj.label46:setFontColor("white");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout22);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setAlign("bottom");
    obj.horzLine17:setName("horzLine17");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart25);
    obj.label47:setAlign("client");
    obj.label47:setText("Natureza");
    obj.label47:setVertTextAlign("trailing");
    obj.label47:setMargins({left=5});
    obj.label47:setAutoSize(true);
    obj.label47:setWordWrap(false);
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flowLayout8);
    obj.dataLink22:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.natureza'});
    obj.dataLink22:setName("dataLink22");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout8);
    obj.flowPart26:setMinWidth(206);
    obj.flowPart26:setMaxWidth(250);
    obj.flowPart26:setHeight(17);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.flowPart26);
    obj.imageCheckBox18:setAlign("left");
    obj.imageCheckBox18:setWidth(20);
    obj.imageCheckBox18:setMargins({});
    obj.imageCheckBox18:setField("pericias.religiao");
    obj.imageCheckBox18:setOptimize(false);
    obj.imageCheckBox18:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox18:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox18:setName("imageCheckBox18");
    obj.imageCheckBox18:setHeight(20);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart26);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(26);
    obj.layout23:setMargins({left=2});
    obj.layout23:setName("layout23");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout23);
    obj.label48:setField("pericias.bonusreligiaostr");
    obj.label48:setAlign("client");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setVertTextAlign("trailing");
    obj.label48:setTextTrimming("none");
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout23);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setAlign("bottom");
    obj.horzLine18:setName("horzLine18");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart26);
    obj.label49:setAlign("client");
    obj.label49:setText("Religião");
    obj.label49:setVertTextAlign("trailing");
    obj.label49:setMargins({left=5});
    obj.label49:setAutoSize(true);
    obj.label49:setWordWrap(false);
    obj.label49:setName("label49");
    obj.label49:setFontColor("white");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flowLayout8);
    obj.dataLink23:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.religiao'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.fraLayAtributos);
    obj.dataLink24:setField("atributos.carisma");
    obj.dataLink24:setName("dataLink24");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.fraLayAtributos);
    obj.flowPart27:setHeight(140);
    obj.flowPart27:setMinWidth(320);
    obj.flowPart27:setMaxWidth(420);
    obj.flowPart27:setMinScaledWidth(305);
    obj.flowPart27:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart27);
    obj.layout24:setLeft(6);
    obj.layout24:setTop(12);
    obj.layout24:setWidth(116);
    obj.layout24:setHeight(115);
    obj.layout24:setName("layout24");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout24);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=30, right=30});
    obj.edit9:setField("atributos.carisma");
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setMax(99);
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart27);
    obj.label50:setFrameRegion("modificador");
    obj.label50:setField("atributos.modcarismastr");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setFontSize(46);
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart27);
    obj.label51:setFrameRegion("titulo");
    obj.label51:setText("AUTO-CONTROLE");
    obj.label51:setVertTextAlign("center");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart27);
    obj.flowLayout9:setFrameRegion("RegiaoDePericias");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setLineSpacing(0);
    obj.flowLayout9:setHorzAlign("leading");
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout9);
    obj.flowPart28:setMinWidth(206);
    obj.flowPart28:setMaxWidth(250);
    obj.flowPart28:setHeight(17);
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart28:setVertAlign("leading");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.flowPart28);
    obj.imageCheckBox19:setAlign("left");
    obj.imageCheckBox19:setWidth(20);
    obj.imageCheckBox19:setMargins({});
    obj.imageCheckBox19:setField("resistencias.carisma");
    obj.imageCheckBox19:setOptimize(false);
    obj.imageCheckBox19:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox19:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox19:setName("imageCheckBox19");
    obj.imageCheckBox19:setHeight(20);

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart28);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(26);
    obj.layout25:setMargins({left=2});
    obj.layout25:setName("layout25");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout25);
    obj.label52:setField("resistencias.bonuscarismastr");
    obj.label52:setAlign("client");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("trailing");
    obj.label52:setTextTrimming("none");
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout25);
    obj.horzLine19:setStrokeColor("white");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setAlign("bottom");
    obj.horzLine19:setName("horzLine19");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart28);
    obj.label53:setAlign("client");
    obj.label53:setText("Teste de Resistência");
    obj.label53:setVertTextAlign("trailing");
    obj.label53:setMargins({left=5});
    obj.label53:setAutoSize(true);
    obj.label53:setWordWrap(false);
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.flowLayout9);
    obj.dataLink25:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma'});
    obj.dataLink25:setName("dataLink25");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout9);
    obj.flowPart29:setMinWidth(206);
    obj.flowPart29:setMaxWidth(250);
    obj.flowPart29:setHeight(17);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.flowPart29);
    obj.imageCheckBox20:setAlign("left");
    obj.imageCheckBox20:setWidth(20);
    obj.imageCheckBox20:setMargins({});
    obj.imageCheckBox20:setField("pericias.atuacao");
    obj.imageCheckBox20:setOptimize(false);
    obj.imageCheckBox20:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox20:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox20:setName("imageCheckBox20");
    obj.imageCheckBox20:setHeight(20);

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart29);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(26);
    obj.layout26:setMargins({left=2});
    obj.layout26:setName("layout26");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout26);
    obj.label54:setField("pericias.bonusatuacaostr");
    obj.label54:setAlign("client");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("trailing");
    obj.label54:setTextTrimming("none");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.layout26);
    obj.horzLine20:setStrokeColor("white");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setAlign("bottom");
    obj.horzLine20:setName("horzLine20");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart29);
    obj.label55:setAlign("client");
    obj.label55:setText("Atuação");
    obj.label55:setVertTextAlign("trailing");
    obj.label55:setMargins({left=5});
    obj.label55:setAutoSize(true);
    obj.label55:setWordWrap(false);
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.flowLayout9);
    obj.dataLink26:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao'});
    obj.dataLink26:setName("dataLink26");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout9);
    obj.flowPart30:setMinWidth(206);
    obj.flowPart30:setMaxWidth(250);
    obj.flowPart30:setHeight(17);
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.flowPart30);
    obj.imageCheckBox21:setAlign("left");
    obj.imageCheckBox21:setWidth(20);
    obj.imageCheckBox21:setMargins({});
    obj.imageCheckBox21:setField("pericias.enganacao");
    obj.imageCheckBox21:setOptimize(false);
    obj.imageCheckBox21:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox21:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox21:setName("imageCheckBox21");
    obj.imageCheckBox21:setHeight(20);

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart30);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(26);
    obj.layout27:setMargins({left=2});
    obj.layout27:setName("layout27");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout27);
    obj.label56:setField("pericias.bonusenganacaostr");
    obj.label56:setAlign("client");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("trailing");
    obj.label56:setTextTrimming("none");
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.layout27);
    obj.horzLine21:setStrokeColor("white");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setAlign("bottom");
    obj.horzLine21:setName("horzLine21");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart30);
    obj.label57:setAlign("client");
    obj.label57:setText("Enganação");
    obj.label57:setVertTextAlign("trailing");
    obj.label57:setMargins({left=5});
    obj.label57:setAutoSize(true);
    obj.label57:setWordWrap(false);
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.flowLayout9);
    obj.dataLink27:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao'});
    obj.dataLink27:setName("dataLink27");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout9);
    obj.flowPart31:setMinWidth(206);
    obj.flowPart31:setMaxWidth(250);
    obj.flowPart31:setHeight(17);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart31:setVertAlign("leading");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.flowPart31);
    obj.imageCheckBox22:setAlign("left");
    obj.imageCheckBox22:setWidth(20);
    obj.imageCheckBox22:setMargins({});
    obj.imageCheckBox22:setField("pericias.intimidacao");
    obj.imageCheckBox22:setOptimize(false);
    obj.imageCheckBox22:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox22:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox22:setName("imageCheckBox22");
    obj.imageCheckBox22:setHeight(20);

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart31);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(26);
    obj.layout28:setMargins({left=2});
    obj.layout28:setName("layout28");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout28);
    obj.label58:setField("pericias.bonusintimidacaostr");
    obj.label58:setAlign("client");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setVertTextAlign("trailing");
    obj.label58:setTextTrimming("none");
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.layout28);
    obj.horzLine22:setStrokeColor("white");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setAlign("bottom");
    obj.horzLine22:setName("horzLine22");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart31);
    obj.label59:setAlign("client");
    obj.label59:setText("Intimidação");
    obj.label59:setVertTextAlign("trailing");
    obj.label59:setMargins({left=5});
    obj.label59:setAutoSize(true);
    obj.label59:setWordWrap(false);
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.flowLayout9);
    obj.dataLink28:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao'});
    obj.dataLink28:setName("dataLink28");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout9);
    obj.flowPart32:setMinWidth(206);
    obj.flowPart32:setMaxWidth(250);
    obj.flowPart32:setHeight(17);
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart32:setVertAlign("leading");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.flowPart32);
    obj.imageCheckBox23:setAlign("left");
    obj.imageCheckBox23:setWidth(20);
    obj.imageCheckBox23:setMargins({});
    obj.imageCheckBox23:setField("pericias.persuasao");
    obj.imageCheckBox23:setOptimize(false);
    obj.imageCheckBox23:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox23:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox23:setName("imageCheckBox23");
    obj.imageCheckBox23:setHeight(20);

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart32);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(26);
    obj.layout29:setMargins({left=2});
    obj.layout29:setName("layout29");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setField("pericias.bonuspersuasaostr");
    obj.label60:setAlign("client");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setVertTextAlign("trailing");
    obj.label60:setTextTrimming("none");
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.layout29);
    obj.horzLine23:setStrokeColor("white");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setAlign("bottom");
    obj.horzLine23:setName("horzLine23");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart32);
    obj.label61:setAlign("client");
    obj.label61:setText("Persuasão");
    obj.label61:setVertTextAlign("trailing");
    obj.label61:setMargins({left=5});
    obj.label61:setAutoSize(true);
    obj.label61:setWordWrap(false);
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.flowLayout9);
    obj.dataLink29:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao'});
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.fraLayAtributos);
    obj.dataLink30:setField("atributos.sabedoria");
    obj.dataLink30:setName("dataLink30");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.fraLayAtributos);
    obj.flowPart33:setHeight(140);
    obj.flowPart33:setMinWidth(320);
    obj.flowPart33:setMaxWidth(420);
    obj.flowPart33:setMinScaledWidth(305);
    obj.flowPart33:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart33:setVertAlign("leading");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart33);
    obj.layout30:setLeft(6);
    obj.layout30:setTop(12);
    obj.layout30:setWidth(116);
    obj.layout30:setHeight(115);
    obj.layout30:setName("layout30");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout30);
    obj.edit10:setAlign("top");
    obj.edit10:setMargins({left=30, right=30});
    obj.edit10:setField("atributos.sabedoria");
    obj.edit10:setHeight(30);
    obj.edit10:setType("number");
    obj.edit10:setMin(0);
    obj.edit10:setMax(99);
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(15);
    obj.edit10:setFontColor("white");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart33);
    obj.label62:setFrameRegion("modificador");
    obj.label62:setField("atributos.modsabedoriastr");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setVertTextAlign("center");
    obj.label62:setFontSize(46);
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart33);
    obj.label63:setFrameRegion("titulo");
    obj.label63:setText("SABEDORIA");
    obj.label63:setVertTextAlign("center");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowPart33);
    obj.flowLayout10:setFrameRegion("RegiaoDePericias");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setLineSpacing(0);
    obj.flowLayout10:setHorzAlign("leading");
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout10:setVertAlign("leading");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout10);
    obj.flowPart34:setMinWidth(206);
    obj.flowPart34:setMaxWidth(250);
    obj.flowPart34:setHeight(17);
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart34:setVertAlign("leading");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.flowPart34);
    obj.imageCheckBox24:setAlign("left");
    obj.imageCheckBox24:setWidth(20);
    obj.imageCheckBox24:setMargins({});
    obj.imageCheckBox24:setField("resistencias.sabedoria");
    obj.imageCheckBox24:setOptimize(false);
    obj.imageCheckBox24:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox24:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox24:setName("imageCheckBox24");
    obj.imageCheckBox24:setHeight(20);

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart34);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(26);
    obj.layout31:setMargins({left=2});
    obj.layout31:setName("layout31");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout31);
    obj.label64:setField("resistencias.bonussabedoriastr");
    obj.label64:setAlign("client");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("trailing");
    obj.label64:setTextTrimming("none");
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.layout31);
    obj.horzLine24:setStrokeColor("white");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setAlign("bottom");
    obj.horzLine24:setName("horzLine24");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart34);
    obj.label65:setAlign("client");
    obj.label65:setText("Teste de Resistência");
    obj.label65:setVertTextAlign("trailing");
    obj.label65:setMargins({left=5});
    obj.label65:setAutoSize(true);
    obj.label65:setWordWrap(false);
    obj.label65:setName("label65");
    obj.label65:setFontColor("white");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.flowLayout10);
    obj.dataLink31:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'resistencias.sabedoria'});
    obj.dataLink31:setName("dataLink31");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout10);
    obj.flowPart35:setMinWidth(206);
    obj.flowPart35:setMaxWidth(250);
    obj.flowPart35:setHeight(17);
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart35:setVertAlign("leading");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.flowPart35);
    obj.imageCheckBox25:setAlign("left");
    obj.imageCheckBox25:setWidth(20);
    obj.imageCheckBox25:setMargins({});
    obj.imageCheckBox25:setField("pericias.adestrarAnimais");
    obj.imageCheckBox25:setOptimize(false);
    obj.imageCheckBox25:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox25:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox25:setName("imageCheckBox25");
    obj.imageCheckBox25:setHeight(20);

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowPart35);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(26);
    obj.layout32:setMargins({left=2});
    obj.layout32:setName("layout32");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout32);
    obj.label66:setField("pericias.bonusadestrarAnimaisstr");
    obj.label66:setAlign("client");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("trailing");
    obj.label66:setTextTrimming("none");
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.layout32);
    obj.horzLine25:setStrokeColor("white");
    obj.horzLine25:setStrokeSize(1);
    obj.horzLine25:setAlign("bottom");
    obj.horzLine25:setName("horzLine25");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart35);
    obj.label67:setAlign("client");
    obj.label67:setText("Adestrar Animais");
    obj.label67:setVertTextAlign("trailing");
    obj.label67:setMargins({left=5});
    obj.label67:setAutoSize(true);
    obj.label67:setWordWrap(false);
    obj.label67:setName("label67");
    obj.label67:setFontColor("white");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.flowLayout10);
    obj.dataLink32:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.adestrarAnimais'});
    obj.dataLink32:setName("dataLink32");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout10);
    obj.flowPart36:setMinWidth(206);
    obj.flowPart36:setMaxWidth(250);
    obj.flowPart36:setHeight(17);
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart36:setVertAlign("leading");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.flowPart36);
    obj.imageCheckBox26:setAlign("left");
    obj.imageCheckBox26:setWidth(20);
    obj.imageCheckBox26:setMargins({});
    obj.imageCheckBox26:setField("pericias.intuicao");
    obj.imageCheckBox26:setOptimize(false);
    obj.imageCheckBox26:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox26:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox26:setName("imageCheckBox26");
    obj.imageCheckBox26:setHeight(20);

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowPart36);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(26);
    obj.layout33:setMargins({left=2});
    obj.layout33:setName("layout33");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout33);
    obj.label68:setField("pericias.bonusintuicaostr");
    obj.label68:setAlign("client");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setVertTextAlign("trailing");
    obj.label68:setTextTrimming("none");
    obj.label68:setName("label68");
    obj.label68:setFontColor("white");

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.layout33);
    obj.horzLine26:setStrokeColor("white");
    obj.horzLine26:setStrokeSize(1);
    obj.horzLine26:setAlign("bottom");
    obj.horzLine26:setName("horzLine26");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart36);
    obj.label69:setAlign("client");
    obj.label69:setText("Intuição");
    obj.label69:setVertTextAlign("trailing");
    obj.label69:setMargins({left=5});
    obj.label69:setAutoSize(true);
    obj.label69:setWordWrap(false);
    obj.label69:setName("label69");
    obj.label69:setFontColor("white");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.flowLayout10);
    obj.dataLink33:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.intuicao'});
    obj.dataLink33:setName("dataLink33");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout10);
    obj.flowPart37:setMinWidth(206);
    obj.flowPart37:setMaxWidth(250);
    obj.flowPart37:setHeight(17);
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart37:setVertAlign("leading");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.flowPart37);
    obj.imageCheckBox27:setAlign("left");
    obj.imageCheckBox27:setWidth(20);
    obj.imageCheckBox27:setMargins({});
    obj.imageCheckBox27:setField("pericias.medicina");
    obj.imageCheckBox27:setOptimize(false);
    obj.imageCheckBox27:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox27:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox27:setName("imageCheckBox27");
    obj.imageCheckBox27:setHeight(20);

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowPart37);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(26);
    obj.layout34:setMargins({left=2});
    obj.layout34:setName("layout34");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout34);
    obj.label70:setField("pericias.bonusmedicinastr");
    obj.label70:setAlign("client");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setVertTextAlign("trailing");
    obj.label70:setTextTrimming("none");
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.layout34);
    obj.horzLine27:setStrokeColor("white");
    obj.horzLine27:setStrokeSize(1);
    obj.horzLine27:setAlign("bottom");
    obj.horzLine27:setName("horzLine27");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart37);
    obj.label71:setAlign("client");
    obj.label71:setText("Medicina");
    obj.label71:setVertTextAlign("trailing");
    obj.label71:setMargins({left=5});
    obj.label71:setAutoSize(true);
    obj.label71:setWordWrap(false);
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.flowLayout10);
    obj.dataLink34:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.medicina'});
    obj.dataLink34:setName("dataLink34");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout10);
    obj.flowPart38:setMinWidth(206);
    obj.flowPart38:setMaxWidth(250);
    obj.flowPart38:setHeight(17);
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart38:setVertAlign("leading");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.flowPart38);
    obj.imageCheckBox28:setAlign("left");
    obj.imageCheckBox28:setWidth(20);
    obj.imageCheckBox28:setMargins({});
    obj.imageCheckBox28:setField("pericias.percepcao");
    obj.imageCheckBox28:setOptimize(false);
    obj.imageCheckBox28:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox28:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox28:setName("imageCheckBox28");
    obj.imageCheckBox28:setHeight(20);

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowPart38);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(26);
    obj.layout35:setMargins({left=2});
    obj.layout35:setName("layout35");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout35);
    obj.label72:setField("pericias.bonuspercepcaostr");
    obj.label72:setAlign("client");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setVertTextAlign("trailing");
    obj.label72:setTextTrimming("none");
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.horzLine28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine28:setParent(obj.layout35);
    obj.horzLine28:setStrokeColor("white");
    obj.horzLine28:setStrokeSize(1);
    obj.horzLine28:setAlign("bottom");
    obj.horzLine28:setName("horzLine28");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart38);
    obj.label73:setAlign("client");
    obj.label73:setText("Percepção");
    obj.label73:setVertTextAlign("trailing");
    obj.label73:setMargins({left=5});
    obj.label73:setAutoSize(true);
    obj.label73:setWordWrap(false);
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.flowLayout10);
    obj.dataLink35:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.percepcao'});
    obj.dataLink35:setName("dataLink35");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout10);
    obj.flowPart39:setMinWidth(206);
    obj.flowPart39:setMaxWidth(250);
    obj.flowPart39:setHeight(17);
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart39:setVertAlign("leading");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.flowPart39);
    obj.imageCheckBox29:setAlign("left");
    obj.imageCheckBox29:setWidth(20);
    obj.imageCheckBox29:setMargins({});
    obj.imageCheckBox29:setField("pericias.sobrevivencia");
    obj.imageCheckBox29:setOptimize(false);
    obj.imageCheckBox29:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox29:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox29:setName("imageCheckBox29");
    obj.imageCheckBox29:setHeight(20);

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flowPart39);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(26);
    obj.layout36:setMargins({left=2});
    obj.layout36:setName("layout36");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout36);
    obj.label74:setField("pericias.bonussobrevivenciastr");
    obj.label74:setAlign("client");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setVertTextAlign("trailing");
    obj.label74:setTextTrimming("none");
    obj.label74:setName("label74");
    obj.label74:setFontColor("white");

    obj.horzLine29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine29:setParent(obj.layout36);
    obj.horzLine29:setStrokeColor("white");
    obj.horzLine29:setStrokeSize(1);
    obj.horzLine29:setAlign("bottom");
    obj.horzLine29:setName("horzLine29");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart39);
    obj.label75:setAlign("client");
    obj.label75:setText("Sobrevivência");
    obj.label75:setVertTextAlign("trailing");
    obj.label75:setMargins({left=5});
    obj.label75:setAutoSize(true);
    obj.label75:setWordWrap(false);
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.flowLayout10);
    obj.dataLink36:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.sobrevivencia'});
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.fraLayAtributos);
    obj.dataLink37:setField("atributos.carisma");
    obj.dataLink37:setName("dataLink37");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.fraLayAtributos);
    obj.flowPart40:setHeight(140);
    obj.flowPart40:setMinWidth(320);
    obj.flowPart40:setMaxWidth(420);
    obj.flowPart40:setMinScaledWidth(305);
    obj.flowPart40:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart40:setVertAlign("leading");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.flowPart40);
    obj.layout37:setLeft(6);
    obj.layout37:setTop(12);
    obj.layout37:setWidth(116);
    obj.layout37:setHeight(115);
    obj.layout37:setName("layout37");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout37);
    obj.edit11:setAlign("top");
    obj.edit11:setMargins({left=30, right=30});
    obj.edit11:setField("atributos.carisma");
    obj.edit11:setHeight(30);
    obj.edit11:setType("number");
    obj.edit11:setMin(0);
    obj.edit11:setMax(99);
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(15);
    obj.edit11:setFontColor("white");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart40);
    obj.label76:setFrameRegion("modificador");
    obj.label76:setField("atributos.modcarismastr");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setVertTextAlign("center");
    obj.label76:setFontSize(46);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setName("label76");
    obj.label76:setFontColor("white");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart40);
    obj.label77:setFrameRegion("titulo");
    obj.label77:setText("CARISMA");
    obj.label77:setVertTextAlign("center");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart40);
    obj.flowLayout11:setFrameRegion("RegiaoDePericias");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setLineSpacing(0);
    obj.flowLayout11:setHorzAlign("leading");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout11:setVertAlign("leading");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout11);
    obj.flowPart41:setMinWidth(206);
    obj.flowPart41:setMaxWidth(250);
    obj.flowPart41:setHeight(17);
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart41:setVertAlign("leading");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.flowPart41);
    obj.imageCheckBox30:setAlign("left");
    obj.imageCheckBox30:setWidth(20);
    obj.imageCheckBox30:setMargins({});
    obj.imageCheckBox30:setField("resistencias.carisma");
    obj.imageCheckBox30:setOptimize(false);
    obj.imageCheckBox30:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox30:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox30:setName("imageCheckBox30");
    obj.imageCheckBox30:setHeight(20);

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.flowPart41);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(26);
    obj.layout38:setMargins({left=2});
    obj.layout38:setName("layout38");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout38);
    obj.label78:setField("resistencias.bonuscarismastr");
    obj.label78:setAlign("client");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("trailing");
    obj.label78:setTextTrimming("none");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.horzLine30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine30:setParent(obj.layout38);
    obj.horzLine30:setStrokeColor("white");
    obj.horzLine30:setStrokeSize(1);
    obj.horzLine30:setAlign("bottom");
    obj.horzLine30:setName("horzLine30");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart41);
    obj.label79:setAlign("client");
    obj.label79:setText("Teste de Resistência");
    obj.label79:setVertTextAlign("trailing");
    obj.label79:setMargins({left=5});
    obj.label79:setAutoSize(true);
    obj.label79:setWordWrap(false);
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flowLayout11);
    obj.dataLink38:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma'});
    obj.dataLink38:setName("dataLink38");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout11);
    obj.flowPart42:setMinWidth(206);
    obj.flowPart42:setMaxWidth(250);
    obj.flowPart42:setHeight(17);
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart42:setVertAlign("leading");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.flowPart42);
    obj.imageCheckBox31:setAlign("left");
    obj.imageCheckBox31:setWidth(20);
    obj.imageCheckBox31:setMargins({});
    obj.imageCheckBox31:setField("pericias.atuacao");
    obj.imageCheckBox31:setOptimize(false);
    obj.imageCheckBox31:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox31:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox31:setName("imageCheckBox31");
    obj.imageCheckBox31:setHeight(20);

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.flowPart42);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(26);
    obj.layout39:setMargins({left=2});
    obj.layout39:setName("layout39");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout39);
    obj.label80:setField("pericias.bonusatuacaostr");
    obj.label80:setAlign("client");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("trailing");
    obj.label80:setTextTrimming("none");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");

    obj.horzLine31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine31:setParent(obj.layout39);
    obj.horzLine31:setStrokeColor("white");
    obj.horzLine31:setStrokeSize(1);
    obj.horzLine31:setAlign("bottom");
    obj.horzLine31:setName("horzLine31");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart42);
    obj.label81:setAlign("client");
    obj.label81:setText("Atuação");
    obj.label81:setVertTextAlign("trailing");
    obj.label81:setMargins({left=5});
    obj.label81:setAutoSize(true);
    obj.label81:setWordWrap(false);
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.flowLayout11);
    obj.dataLink39:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao'});
    obj.dataLink39:setName("dataLink39");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout11);
    obj.flowPart43:setMinWidth(206);
    obj.flowPart43:setMaxWidth(250);
    obj.flowPart43:setHeight(17);
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart43:setVertAlign("leading");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.flowPart43);
    obj.imageCheckBox32:setAlign("left");
    obj.imageCheckBox32:setWidth(20);
    obj.imageCheckBox32:setMargins({});
    obj.imageCheckBox32:setField("pericias.enganacao");
    obj.imageCheckBox32:setOptimize(false);
    obj.imageCheckBox32:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox32:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox32:setName("imageCheckBox32");
    obj.imageCheckBox32:setHeight(20);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.flowPart43);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(26);
    obj.layout40:setMargins({left=2});
    obj.layout40:setName("layout40");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout40);
    obj.label82:setField("pericias.bonusenganacaostr");
    obj.label82:setAlign("client");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setVertTextAlign("trailing");
    obj.label82:setTextTrimming("none");
    obj.label82:setName("label82");
    obj.label82:setFontColor("white");

    obj.horzLine32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine32:setParent(obj.layout40);
    obj.horzLine32:setStrokeColor("white");
    obj.horzLine32:setStrokeSize(1);
    obj.horzLine32:setAlign("bottom");
    obj.horzLine32:setName("horzLine32");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart43);
    obj.label83:setAlign("client");
    obj.label83:setText("Enganação");
    obj.label83:setVertTextAlign("trailing");
    obj.label83:setMargins({left=5});
    obj.label83:setAutoSize(true);
    obj.label83:setWordWrap(false);
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.flowLayout11);
    obj.dataLink40:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao'});
    obj.dataLink40:setName("dataLink40");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout11);
    obj.flowPart44:setMinWidth(206);
    obj.flowPart44:setMaxWidth(250);
    obj.flowPart44:setHeight(17);
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart44:setVertAlign("leading");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.flowPart44);
    obj.imageCheckBox33:setAlign("left");
    obj.imageCheckBox33:setWidth(20);
    obj.imageCheckBox33:setMargins({});
    obj.imageCheckBox33:setField("pericias.intimidacao");
    obj.imageCheckBox33:setOptimize(false);
    obj.imageCheckBox33:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox33:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox33:setName("imageCheckBox33");
    obj.imageCheckBox33:setHeight(20);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.flowPart44);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(26);
    obj.layout41:setMargins({left=2});
    obj.layout41:setName("layout41");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout41);
    obj.label84:setField("pericias.bonusintimidacaostr");
    obj.label84:setAlign("client");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("trailing");
    obj.label84:setTextTrimming("none");
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");

    obj.horzLine33 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine33:setParent(obj.layout41);
    obj.horzLine33:setStrokeColor("white");
    obj.horzLine33:setStrokeSize(1);
    obj.horzLine33:setAlign("bottom");
    obj.horzLine33:setName("horzLine33");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart44);
    obj.label85:setAlign("client");
    obj.label85:setText("Intimidação");
    obj.label85:setVertTextAlign("trailing");
    obj.label85:setMargins({left=5});
    obj.label85:setAutoSize(true);
    obj.label85:setWordWrap(false);
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.flowLayout11);
    obj.dataLink41:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao'});
    obj.dataLink41:setName("dataLink41");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout11);
    obj.flowPart45:setMinWidth(206);
    obj.flowPart45:setMaxWidth(250);
    obj.flowPart45:setHeight(17);
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart45:setVertAlign("leading");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.flowPart45);
    obj.imageCheckBox34:setAlign("left");
    obj.imageCheckBox34:setWidth(20);
    obj.imageCheckBox34:setMargins({});
    obj.imageCheckBox34:setField("pericias.persuasao");
    obj.imageCheckBox34:setOptimize(false);
    obj.imageCheckBox34:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox34:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox34:setName("imageCheckBox34");
    obj.imageCheckBox34:setHeight(20);

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.flowPart45);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(26);
    obj.layout42:setMargins({left=2});
    obj.layout42:setName("layout42");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout42);
    obj.label86:setField("pericias.bonuspersuasaostr");
    obj.label86:setAlign("client");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setVertTextAlign("trailing");
    obj.label86:setTextTrimming("none");
    obj.label86:setName("label86");
    obj.label86:setFontColor("white");

    obj.horzLine34 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine34:setParent(obj.layout42);
    obj.horzLine34:setStrokeColor("white");
    obj.horzLine34:setStrokeSize(1);
    obj.horzLine34:setAlign("bottom");
    obj.horzLine34:setName("horzLine34");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart45);
    obj.label87:setAlign("client");
    obj.label87:setText("Persuasão");
    obj.label87:setVertTextAlign("trailing");
    obj.label87:setMargins({left=5});
    obj.label87:setAutoSize(true);
    obj.label87:setWordWrap(false);
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.flowLayout11);
    obj.dataLink42:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao'});
    obj.dataLink42:setName("dataLink42");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowLayout3);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setVertAlign("leading");
    obj.flowLayout12:setMaxControlsPerLine(1);
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setStepSizes({310, 360});
    obj.flowLayout12:setMinScaledWidth(300);
    obj.flowLayout12:setMaxScaledWidth(340);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout12);
    obj.flowLayout13:setMinWidth(235);
    obj.flowLayout13:setMaxWidth(475);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setAvoidScale(false);
    obj.flowLayout13:setVertAlign("center");
    obj.flowLayout13:setHorzAlign("justify");
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout13);
    obj.flowPart46:setStepSizes({105});
    obj.flowPart46:setMinScaledWidth(75);
    obj.flowPart46:setHeight(120);
    obj.flowPart46:setFrameStyle("frames/shield/frame.xml");
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart46:setVertAlign("leading");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart46);
    obj.label88:setAlign("top");
    obj.label88:setText("CLASSE DE ARMADURA");
    obj.label88:setHeight(20);
    obj.label88:setFontSize(9);
    obj.label88:setWordWrap(true);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setTextTrimming("none");
    obj.label88:setName("label88");
    obj.label88:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart46);
    obj.edit12:setAlign("client");
    obj.edit12:setField("CA");
    obj.edit12:setFontSize(30);
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("white");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout13);
    obj.flowPart47:setStepSizes({105});
    obj.flowPart47:setMinScaledWidth(75);
    obj.flowPart47:setHeight(120);
    obj.flowPart47:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart47:setVertAlign("leading");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart47);
    obj.label89:setAlign("top");
    obj.label89:setText("INICIATIVA");
    obj.label89:setHeight(20);
    obj.label89:setFontSize(9);
    obj.label89:setWordWrap(true);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setTextTrimming("none");
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart47);
    obj.edit13:setAlign("client");
    obj.edit13:setField("iniciativa");
    obj.edit13:setFontSize(30);
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("white");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout13);
    obj.flowPart48:setStepSizes({105});
    obj.flowPart48:setMinScaledWidth(75);
    obj.flowPart48:setHeight(120);
    obj.flowPart48:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart48:setVertAlign("leading");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart48);
    obj.label90:setAlign("top");
    obj.label90:setText("DESLOCAMENTO");
    obj.label90:setHeight(20);
    obj.label90:setFontSize(9);
    obj.label90:setWordWrap(true);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setTextTrimming("none");
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart48);
    obj.edit14:setAlign("client");
    obj.edit14:setField("deslocamento");
    obj.edit14:setFontSize(30);
    obj.edit14:setName("edit14");
    obj.edit14:setTransparent(true);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("white");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout12);
    obj.flowPart49:setMinWidth(235);
    obj.flowPart49:setMaxWidth(475);
    obj.flowPart49:setMinScaledWidth(200);
    obj.flowPart49:setHeight(175);
    obj.flowPart49:setMargins({left=2, right=2, top=4, bottom=8});
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setVertAlign("leading");

    obj.frame1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.flowPart49);
    obj.frame1:setAlign("client");
    obj.frame1:setFrameStyle("frames/panel5/topPanel.xml");
    obj.frame1:setMargins({left = 4, right = 4, bottom=4});
    obj.frame1:setName("frame1");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.frame1);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout43);
    obj.label91:setAlign("left");
    obj.label91:setAutoSize(true);
    obj.label91:setText("PONTOS DE VIDA MÁXIMO:");
    obj.label91:setTextTrimming("none");
    obj.label91:setWordWrap(false);
    obj.label91:setFontSize(12);
    obj.label91:setHorzTextAlign("trailing");
    obj.label91:setName("label91");
    obj.label91:setFontColor("#D0D0D0");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("client");
    obj.layout44:setMargins({left=5, right=3});
    obj.layout44:setName("layout44");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout44);
    obj.edit15:setAlign("client");
    obj.edit15:setField("PVMax");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(15);
    obj.edit15:setFontColor("white");
    obj.edit15:setTransparent(true);

    obj.horzLine35 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine35:setParent(obj.layout44);
    obj.horzLine35:setAlign("bottom");
    obj.horzLine35:setStrokeColor("gray");
    obj.horzLine35:setName("horzLine35");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.frame1);
    obj.edit16:setAlign("client");
    obj.edit16:setField("PV");
    obj.edit16:setMargins({top=2});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setFontSize(36);
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("white");
    obj.edit16:setTransparent(true);

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.frame1);
    obj.label92:setAlign("bottom");
    obj.label92:setAutoSize(true);
    obj.label92:setText("PONTOS DE VIDA ATUAL");
    obj.label92:setFontSize(11);
    obj.label92:setVertTextAlign("center");
    obj.label92:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setName("label92");
    obj.label92:setFontColor("white");

    obj.frame2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.flowPart49);
    obj.frame2:setAlign("bottom");
    obj.frame2:setHeight(70);
    obj.frame2:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.frame2:setMargins({left = 4, right = 4});
    obj.frame2:setName("frame2");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.frame2);
    obj.edit17:setAlign("client");
    obj.edit17:setField("PVTemporario");
    obj.edit17:setMargins({top=2});
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setFontSize(36);
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("white");
    obj.edit17:setTransparent(true);

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.frame2);
    obj.label93:setAlign("bottom");
    obj.label93:setAutoSize(true);
    obj.label93:setText("PONTOS DE VIDA TEMPORÁRIOS");
    obj.label93:setFontSize(11);
    obj.label93:setVertTextAlign("center");
    obj.label93:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setName("label93");
    obj.label93:setFontColor("white");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Background");
    obj.tab2:setName("tab2");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab2);
    lfm_setPropAsString(obj.richEdit1, "animateImages",  "true");
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#363B45");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("txt");
    lfm_setPropAsString(obj.richEdit1, "hideSelection",  "false");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "15");
    lfm_setPropAsString(obj.richEdit1, "showToolbar",  "true");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Caracteristicas");
    obj.tab3:setName("tab3");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Equipamento");
    obj.tab4:setName("tab4");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Habilidades");
    obj.tab5:setName("tab5");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.pgcPrincipal);
    obj.tab6:setTitle("Vida");
    obj.tab6:setName("tab6");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.pgcPrincipal);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab7);
    lfm_setPropAsString(obj.richEdit2, "animateImages",  "true");
    obj.richEdit2:setAlign("client");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#363B45");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setField("txt");
    lfm_setPropAsString(obj.richEdit2, "hideSelection",  "false");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "15");
    lfm_setPropAsString(obj.richEdit2, "showToolbar",  "true");
    obj.richEdit2:setName("richEdit2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.moddestreza = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.moddestrezastr = "+" .. modificador;
            					else	
            						sheet.atributos.moddestrezastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.moddestreza = nil;
            					sheet.atributos.moddestrezastr = nil;
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.destreza or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusdestreza = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusdestrezastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusdestrezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusdestreza = nil;
            								sheet.resistencias.bonusdestrezastr = nil;
            							end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.acrobacia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusacrobacia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusacrobaciastr = "+" .. valor;
            								else
            									sheet.pericias.bonusacrobaciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusacrobacia = nil;
            								sheet.pericias.bonusacrobaciastr = nil;
            							end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.furtividade or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusfurtividade	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusfurtividadestr = "+" .. valor;
            								else
            									sheet.pericias.bonusfurtividadestr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusfurtividade = nil;
            								sheet.pericias.bonusfurtividadestr = nil;
            							end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.prestidigitacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusprestidigitacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusprestidigitacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusprestidigitacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusprestidigitacao = nil;
            								sheet.pericias.bonusprestidigitacaostr = nil;
            							end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modforca = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modforcastr = "+" .. modificador;
            					else	
            						sheet.atributos.modforcastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modforca = nil;
            					sheet.atributos.modforcastr = nil;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modforca;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.forca or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusforca = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusforcastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusforcastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusforca = nil;
            								sheet.resistencias.bonusforcastr = nil;
            							end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modforca;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atletismo or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatletismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatletismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatletismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatletismo = nil;
            								sheet.pericias.bonusatletismostr = nil;
            							end;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modconstituicao = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modconstituicaostr = "+" .. modificador;
            					else	
            						sheet.atributos.modconstituicaostr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modconstituicao = nil;
            					sheet.atributos.modconstituicaostr = nil;
            				end;
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modconstituicao;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.constituicao or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusconstituicao = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusconstituicaostr = "+" .. valor;
            								else
            									sheet.resistencias.bonusconstituicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusconstituicao = nil;
            								sheet.resistencias.bonusconstituicaostr = nil;
            							end;
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modcarisma = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else	
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end, obj);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.carisma or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonuscarisma = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonuscarismastr = "+" .. valor;
            								else
            									sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonuscarisma = nil;
            								sheet.resistencias.bonuscarismastr = nil;
            							end;
        end, obj);

    obj._e_event12 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atuacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatuacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatuacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatuacao = nil;
            								sheet.pericias.bonusatuacaostr = nil;
            							end;
        end, obj);

    obj._e_event13 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.enganacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusenganacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusenganacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusenganacao = nil;
            								sheet.pericias.bonusenganacaostr = nil;
            							end;
        end, obj);

    obj._e_event14 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intimidacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintimidacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintimidacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintimidacao = nil;
            								sheet.pericias.bonusintimidacaostr = nil;
            							end;
        end, obj);

    obj._e_event15 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.persuasao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspersuasao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspersuasaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspersuasao = nil;
            								sheet.pericias.bonuspersuasaostr = nil;
            							end;
        end, obj);

    obj._e_event16 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modinteligencia = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modinteligenciastr = "+" .. modificador;
            					else	
            						sheet.atributos.modinteligenciastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modinteligencia = nil;
            					sheet.atributos.modinteligenciastr = nil;
            				end;
        end, obj);

    obj._e_event17 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.inteligencia or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusinteligencia = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusinteligenciastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusinteligenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusinteligencia = nil;
            								sheet.resistencias.bonusinteligenciastr = nil;
            							end;
        end, obj);

    obj._e_event18 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.arcanismo or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusarcanismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusarcanismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusarcanismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusarcanismo = nil;
            								sheet.pericias.bonusarcanismostr = nil;
            							end;
        end, obj);

    obj._e_event19 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.historia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonushistoria	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonushistoriastr = "+" .. valor;
            								else
            									sheet.pericias.bonushistoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonushistoria = nil;
            								sheet.pericias.bonushistoriastr = nil;
            							end;
        end, obj);

    obj._e_event20 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.investigacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusinvestigacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusinvestigacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusinvestigacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusinvestigacao = nil;
            								sheet.pericias.bonusinvestigacaostr = nil;
            							end;
        end, obj);

    obj._e_event21 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.natureza or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusnatureza	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusnaturezastr = "+" .. valor;
            								else
            									sheet.pericias.bonusnaturezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusnatureza = nil;
            								sheet.pericias.bonusnaturezastr = nil;
            							end;
        end, obj);

    obj._e_event22 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.religiao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusreligiao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusreligiaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusreligiaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusreligiao = nil;
            								sheet.pericias.bonusreligiaostr = nil;
            							end;
        end, obj);

    obj._e_event23 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modcarisma = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else	
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end, obj);

    obj._e_event24 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.carisma or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonuscarisma = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonuscarismastr = "+" .. valor;
            								else
            									sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonuscarisma = nil;
            								sheet.resistencias.bonuscarismastr = nil;
            							end;
        end, obj);

    obj._e_event25 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atuacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatuacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatuacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatuacao = nil;
            								sheet.pericias.bonusatuacaostr = nil;
            							end;
        end, obj);

    obj._e_event26 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.enganacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusenganacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusenganacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusenganacao = nil;
            								sheet.pericias.bonusenganacaostr = nil;
            							end;
        end, obj);

    obj._e_event27 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intimidacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintimidacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintimidacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintimidacao = nil;
            								sheet.pericias.bonusintimidacaostr = nil;
            							end;
        end, obj);

    obj._e_event28 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.persuasao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspersuasao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspersuasaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspersuasao = nil;
            								sheet.pericias.bonuspersuasaostr = nil;
            							end;
        end, obj);

    obj._e_event29 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modsabedoria = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modsabedoriastr = "+" .. modificador;
            					else	
            						sheet.atributos.modsabedoriastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modsabedoria = nil;
            					sheet.atributos.modsabedoriastr = nil;
            				end;
        end, obj);

    obj._e_event30 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.sabedoria or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonussabedoria = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonussabedoriastr = "+" .. valor;
            								else
            									sheet.resistencias.bonussabedoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonussabedoria = nil;
            								sheet.resistencias.bonussabedoriastr = nil;
            							end;
        end, obj);

    obj._e_event31 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.adestrarAnimais or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusadestrarAnimais	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusadestrarAnimaisstr = "+" .. valor;
            								else
            									sheet.pericias.bonusadestrarAnimaisstr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusadestrarAnimais = nil;
            								sheet.pericias.bonusadestrarAnimaisstr = nil;
            							end;
        end, obj);

    obj._e_event32 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intuicao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintuicao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintuicaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintuicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintuicao = nil;
            								sheet.pericias.bonusintuicaostr = nil;
            							end;
        end, obj);

    obj._e_event33 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.medicina or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusmedicina	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusmedicinastr = "+" .. valor;
            								else
            									sheet.pericias.bonusmedicinastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusmedicina = nil;
            								sheet.pericias.bonusmedicinastr = nil;
            							end;
        end, obj);

    obj._e_event34 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.percepcao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspercepcao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspercepcaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspercepcaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspercepcao = nil;
            								sheet.pericias.bonuspercepcaostr = nil;
            							end;
        end, obj);

    obj._e_event35 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.sobrevivencia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonussobrevivencia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonussobrevivenciastr = "+" .. valor;
            								else
            									sheet.pericias.bonussobrevivenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonussobrevivencia = nil;
            								sheet.pericias.bonussobrevivenciastr = nil;
            							end;
        end, obj);

    obj._e_event36 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero;
            				
            				if numAsStr ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modcarisma = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else	
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end, obj);

    obj._e_event37 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.carisma or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonuscarisma = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonuscarismastr = "+" .. valor;
            								else
            									sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonuscarisma = nil;
            								sheet.resistencias.bonuscarismastr = nil;
            							end;
        end, obj);

    obj._e_event38 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atuacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatuacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatuacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatuacao = nil;
            								sheet.pericias.bonusatuacaostr = nil;
            							end;
        end, obj);

    obj._e_event39 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.enganacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusenganacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusenganacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusenganacao = nil;
            								sheet.pericias.bonusenganacaostr = nil;
            							end;
        end, obj);

    obj._e_event40 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intimidacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintimidacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintimidacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintimidacao = nil;
            								sheet.pericias.bonusintimidacaostr = nil;
            							end;
        end, obj);

    obj._e_event41 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.persuasao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspersuasao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspersuasaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspersuasao = nil;
            								sheet.pericias.bonuspersuasaostr = nil;
            							end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.horzLine35 ~= nil then self.horzLine35:destroy(); self.horzLine35 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.horzLine30 ~= nil then self.horzLine30:destroy(); self.horzLine30 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.horzLine28 ~= nil then self.horzLine28:destroy(); self.horzLine28 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.horzLine34 ~= nil then self.horzLine34:destroy(); self.horzLine34 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.horzLine33 ~= nil then self.horzLine33:destroy(); self.horzLine33 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.horzLine29 ~= nil then self.horzLine29:destroy(); self.horzLine29 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.horzLine32 ~= nil then self.horzLine32:destroy(); self.horzLine32 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.horzLine31 ~= nil then self.horzLine31:destroy(); self.horzLine31 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmElysium()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmElysium();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmElysium = {
    newEditor = newfrmElysium, 
    new = newfrmElysium, 
    name = "frmElysium", 
    dataType = "Ficha_Elysium", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Elysium", 
    description=""};

frmElysium = _frmElysium;
Firecast.registrarForm(_frmElysium);
Firecast.registrarDataType(_frmElysium);

return _frmElysium;
