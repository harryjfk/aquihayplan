FrontendCore.debug=!0,describe("code",function(){beforeEach(function(a){FrontendCore.require(["code"],function(){void 0!==a&&a()})}),it("should exist",function(a){oTestedModule=FrontendCore.instantiate("code"),expect(oTestedModule).toBeTruthy()}),describe("onStart",function(){beforeEach(function(){spyOn(FrontendTools,"getDataModules"),spyOn(FrontendTools,"trackModule"),spyOn(oTestedModule,"autobind"),oTestedModule.onStart()}),it("should exist",function(a){expect(oTestedModule.onStart).toBeTruthy()}),it('should call FrontendTools.trackModule with "JS_Libraries", "call", "code"',function(a){expect(FrontendTools.trackModule).toHaveBeenCalledWith("JS_Libraries","call","code")})}),describe("autobind",function(a){beforeEach(function(){var a=$("<pre><code></code></pre>");spyOn(hljs,"highlightBlock"),oTestedModule.autobind(a[0])}),it("should exist",function(a){spyOn(oTestedModule,"autobind"),expect(oTestedModule.autobind).toBeTruthy()}),it("should call hljs highlightBlock",function(a){expect(hljs.highlightBlock).toHaveBeenCalled()})})});