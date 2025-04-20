µQ
KC:\Proj\DEPLOY\_Mantidos\DEPLOY.KeyCloak\src\DEPLOY.KeyCloak.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 

AddRouting 
( 
opt 
=>  "
{ 
opt 
. 
LowercaseUrls 
= 
true 
; 
opt 
. !
LowercaseQueryStrings 
= 
true  $
;$ %
} 
) 
; 
builder 
. 
Services 
. 
AddApiVersioning 
( 
options 
=>  
{ 
options   
.   
DefaultApiVersion   !
=  " #
new  $ '

ApiVersion  ( 2
(  2 3
$num  3 4
,  4 5
$num  6 7
)  7 8
;  8 9
options!! 
.!! /
#AssumeDefaultVersionWhenUnspecified!! 3
=!!4 5
true!!6 :
;!!: ;
options"" 
."" 
ReportApiVersions"" !
=""" #
true""$ (
;""( )
}## 
)## 
.$$ 
AddApiExplorer$$ 
($$ 
options$$ 
=>$$ 
{%% 
options&& 
.&& 
GroupNameFormat&& 
=&&  !
$str&&" *
;&&* +
options'' 
.'' %
SubstituteApiVersionInUrl'' )
=''* +
true'', 0
;''0 1
}(( 
)(( 
;(( 
builder** 
.** 
Services** 
.** 

AddOpenApi** 
(** 
$str**  
,**  !
options**" )
=>*** ,
{++ 
options,, 
.,, "
AddDocumentTransformer,, "
<,," #+
BearerSecuritySchemeTransformer,,# B
>,,B C
(,,C D
),,D E
;,,E F
}-- 
)-- 
;-- 
builder// 
.// 
Services// 
.// 
AddAuthorization// !
(//! "
)//" #
;//# $
builder22 
.22 
Services22 
.22 +
AddKeycloakWebApiAuthentication22 0
(220 1
builder33 
.33 
Configuration33 
.33 

GetSection33 $
(33$ %)
KeycloakAuthenticationOptions33% B
.33B C
Section33C J
)33J K
,33K L
options33M T
=>33U W
{44 
options55 
.55  
RequireHttpsMetadata55  
=55! "
false55# (
;55( )
options66 
.66 
	Authority66 
=66 
builder66 
.66  
Configuration66  -
[66- .
$str66. H
]66H I
+66J K
$str77 
+77 
builder88 
.88 
Configuration88 
[88 
$str88 .
]88. /
;88/ 0
options99 
.99 
Audience99 
=99 
builder99 
.99 
Configuration99 ,
[99, -
$str99- @
]99@ A
;99A B
options:: 
.:: %
TokenValidationParameters:: %
=::& '
new::( +%
TokenValidationParameters::, E
{;; 
ValidateIssuer<< 
=<< 
true<< 
,<< 
ValidIssuer== 
=== 
builder== 
.== 
Configuration== +
[==+ ,
$str==, F
]==F G
+==H I
$str>> 
+>> 
builder?? 
.?? 
Configuration?? !
[??! "
$str??" 2
]??2 3
,??3 4
ValidateAudience@@ 
=@@ 
true@@ 
,@@  
ValidAudienceAA 
=AA 
builderAA 
.AA  
ConfigurationAA  -
[AA- .
$strAA. A
]AAA B
,AAB C
ValidateLifetimeBB 
=BB 
trueBB 
}CC 
;CC 
}DD 
)DD 
;DD 
varFF 
appFF 
=FF 	
builderFF
 
.FF 
BuildFF 
(FF 
)FF 
;FF 
ifHH 
(HH 
appHH 
.HH 
EnvironmentHH 
.HH 
IsDevelopmentHH !
(HH! "
)HH" #
)HH# $
{II 
appJJ 
.JJ 

MapOpenApiJJ 
(JJ 
)JJ 
;JJ 
}KK 
elseLL 
{MM 
appNN 
.NN 
UseHttpsRedirectionNN 
(NN 
)NN 
;NN 
}OO 
appQQ 
.QQ !
MapScalarApiReferenceQQ 
(QQ 
optionsQQ !
=>QQ" $
{RR 
optionsSS 
.TT 
	WithTitleTT 
(TT 
$strTT 0
)TT0 1
.UU 
	WithThemeUU 
(UU 
ScalarThemeUU 
.UU 
SaturnUU !
)UU! "
.VV 
WithPreferredSchemeVV 
(VV 
$strVV !
)VV! "
.WW (
WithHttpBearerAuthenticationWW !
(WW! "
bearerWW" (
=>WW) +
{XX 
}ZZ 
)ZZ 
;ZZ 
options\\ 
.\\ !
WithDefaultHttpClient\\ !
(\\! "
ScalarTarget\\" .
.\\. /
CSharp\\/ 5
,\\5 6
ScalarClient\\7 C
.\\C D

HttpClient\\D N
)\\N O
;\\O P
}]] 
)]] 
;]] 
app__ 
.__ 
MapPingsEndpoints__ 
(__ 
)__ 
;__ 
appaa 
.aa 
MapNumbersEndpointsaa 
(aa 
)aa 
;aa 
appcc 
.cc 
UseAuthenticationcc 
(cc 
)cc 
;cc 
appdd 
.dd 
UseAuthorizationdd 
(dd 
)dd 
;dd 
awaitff 
appff 	
.ff	 

RunAsyncff
 
(ff 
)ff 
;ff 
[hh #
ExcludeFromCodeCoveragehh 
]hh 
publicii 
partialii 
classii 
Programii 
{ii 
}ii  
[kk #
ExcludeFromCodeCoveragekk 
]kk 
internalll 
sealedll	 
classll +
BearerSecuritySchemeTransformerll 5
(ll5 6)
IAuthenticationSchemeProvidermm !(
authenticationSchemeProvidermm" >
)mm> ?
:mm@ A'
IOpenApiDocumentTransformermmB ]
{nn 
publicoo 

asyncoo 
Taskoo 
TransformAsyncoo $
(oo$ %
OpenApiDocumentpp 
documentpp  
,pp  !-
!OpenApiDocumentTransformerContextqq )
contextqq* 1
,qq1 2
CancellationTokenrr 
cancellationTokenrr +
)rr+ ,
{ss 
vartt !
authenticationSchemestt !
=tt" #
awaittt$ )(
authenticationSchemeProvidertt* F
.ttF G
GetAllSchemesAsyncttG Y
(ttY Z
)ttZ [
;tt[ \
ifuu 

(uu !
authenticationSchemesuu !
.vv 
Anyvv 
(vv 

authSchemevv 
=>vv 

authSchemevv )
.vv) *
Namevv* .
==vv/ 1
$strvv2 :
)vv: ;
)vv; <
{ww 	
varxx 
requirementsxx 
=xx 
newxx "

Dictionaryxx# -
<xx- .
stringxx. 4
,xx4 5!
OpenApiSecuritySchemexx6 K
>xxK L
{yy 
[zz 
$strzz 
]zz 
=zz 
newzz  !
OpenApiSecuritySchemezz! 6
{{{ 
Type|| 
=|| 
SecuritySchemeType|| -
.||- .
Http||. 2
,||2 3
Scheme}} 
=}} 
$str}} %
,}}% &
In~~ 
=~~ 
ParameterLocation~~ *
.~~* +
Header~~+ 1
,~~1 2
BearerFormat  
=! "
$str# 9
}
ÄÄ 
}
ÅÅ 
;
ÅÅ 
document
ÇÇ 
.
ÇÇ 

Components
ÇÇ 
??=
ÇÇ  #
new
ÇÇ$ '
OpenApiComponents
ÇÇ( 9
(
ÇÇ9 :
)
ÇÇ: ;
;
ÇÇ; <
document
ÉÉ 
.
ÉÉ 

Components
ÉÉ 
.
ÉÉ  
SecuritySchemes
ÉÉ  /
=
ÉÉ0 1
requirements
ÉÉ2 >
;
ÉÉ> ?
foreach
ÖÖ 
(
ÖÖ 
var
ÖÖ 
	operation
ÖÖ "
in
ÖÖ# %
document
ÖÖ& .
.
ÖÖ. /
Paths
ÖÖ/ 4
.
ÖÖ4 5
Values
ÖÖ5 ;
.
ÖÖ; <

SelectMany
ÖÖ< F
(
ÖÖF G
path
ÖÖG K
=>
ÖÖL N
path
ÖÖO S
.
ÖÖS T

Operations
ÖÖT ^
)
ÖÖ^ _
)
ÖÖ_ `
{
ÜÜ 
	operation
áá 
.
áá 
Value
áá 
.
áá  
Security
áá  (
.
áá( )
Add
áá) ,
(
áá, -
new
áá- 0(
OpenApiSecurityRequirement
áá1 K
{
àà 
[
ââ 
new
ââ #
OpenApiSecurityScheme
ââ .
{
ää 
	Reference
ãã !
=
ãã" #
new
ãã$ '
OpenApiReference
ãã( 8
{
åå 
Id
çç 
=
çç  
$str
çç! )
,
çç) *
Type
éé  
=
éé! "
ReferenceType
éé# 0
.
éé0 1
SecurityScheme
éé1 ?
}
èè 
}
êê 
]
êê 
=
êê 
Array
êê 
.
êê 
Empty
êê $
<
êê$ %
string
êê% +
>
êê+ ,
(
êê, -
)
êê- .
}
ëë 
)
ëë 
;
ëë 
}
íí 
}
ìì 	
}
îî 
}ïï ﬁ
_C:\Proj\DEPLOY\_Mantidos\DEPLOY.KeyCloak\src\DEPLOY.KeyCloak.API\Endpoints\v1\PingsEndpoints.cs
	namespace 	
DEPLOY
 
. 
KeyCloak 
. 
API 
. 
	Endpoints '
.' (
v1( *
{ 
public 

static 
class 
PingsEndpoints &
{		 
public

 
static

 
void

 
MapPingsEndpoints

 ,
(

, -
this

- 1!
IEndpointRouteBuilder

2 G
app

H K
)

K L
{ 	
var 
versionSetPing 
=  
app! $
. 
NewApiVersionSet !
(! "
$str" (
)( )
. 
Build 
( 
) 
; 
var 
api 
= 
app 
. 
MapGroup 
( 
$str &
)& '
. 
WithApiVersionSet "
(" #
versionSetPing# 1
)1 2
;2 3
api 
. 
MapGet 
( 
$str )
,) *
(+ ,
), -
=>. 0
{ 
return 
TypedResults '
.' (
Ok( *
(* +
new+ .
{ 
version 
=  !
Assembly" *
.* + 
GetExecutingAssembly+ ?
(? @
)@ A
.A B
GetNameB I
(I J
)J K
.K L
VersionL S
!S T
.T U
ToStringU ]
(] ^
)^ _
} 
) 
; 
} 
) 
. 
WithOpenApi 
( 
	operation &
=>' )
new* -
(- .
	operation. 7
)7 8
{ 
OperationId 
=  !
$str" 6
,6 7
}   
)   
.!! 
Produces!! 
<!! 
string!! 
>!! 
(!! 
$num!! !
)!!! "
;!!" #
}"" 	
}## 
}$$ ±
aC:\Proj\DEPLOY\_Mantidos\DEPLOY.KeyCloak\src\DEPLOY.KeyCloak.API\Endpoints\v1\NumbersEndpoints.cs
	namespace 	
DEPLOY
 
. 
KeyCloak 
. 
API 
. 
	Endpoints '
.' (
v1( *
{ 
public 

static 
class 
NumbersEndpoints (
{ 
public 
static 
void 
MapNumbersEndpoints .
(. /
this/ 3!
IEndpointRouteBuilder4 I
appJ M
)M N
{ 	
var  
apiVersionSetNumbers $
=% &
app' *
. 
NewApiVersionSet  
(  !
$str! *
)* +
. 
HasApiVersion 
( 
new !

ApiVersion" ,
(, -
$num- .
). /
)/ 0
. 
ReportApiVersions !
(! "
)" #
. 
Build 
( 
) 
; 
var 
api 
= 
app 
. 
MapGroup 
( 
$str A
)A B
.  
RequireAuthorization %
(% &
)& '
. 
WithApiVersionSet "
(" # 
apiVersionSetNumbers# 7
)7 8
;8 9
api 
. 
MapPost 
( 
$str /
,/ 0 
GetRandomNumberAsync1 E
)E F
. 
Produces 
( 
$num 
) 
. 
Produces 
( 
$num 
) 
.   
Produces   
(   
$num   
)   
.!! 
WithOpenApi!! 
(!! 
	operation!! '
=>!!( *
new!!+ .
(!!. /
	operation!!/ 8
)!!8 9
{"" 
OperationId##  
=##! "
$str### 7
,##7 8
Summary$$ 
=$$ 
$str$$ 3
,$$3 4
Description%%  
=%%! "
$str%%# 1
,%%1 2
Tags&& 
=&& 
new&& 
List&&  $
<&&$ %

OpenApiTag&&% /
>&&/ 0
{&&1 2
new&&3 6
(&&6 7
)&&7 8
{&&9 :
Name&&; ?
=&&@ A
$str&&B Q
}&&R S
}&&T U
}'' 
)'' 
;'' 
async)) 
Task)) 
<)) 
IResult)) 
>))  
GetRandomNumberAsync))  4
())4 5
CancellationToken** !
cancellationToken**" 3
=**4 5
default**6 =
)**= >
{++ 
if,, 
(,, 
Random,, 
.,, 
Shared,, !
.,,! "
Next,," &
(,,& '
$num,,' (
,,,( )
$num,,* +
),,+ ,
==,,- /
$num,,0 1
),,1 2
{-- 
return.. 
TypedResults.. '
...' (
UnprocessableEntity..( ;
(..; <
new..< ?
	ValueTask..@ I
(..I J
)..J K
)..K L
;..L M
}// 
return11 
TypedResults11 #
.11# $
Ok11$ &
(11& '
)11' (
;11( )
}22 
}33 	
}44 
}55 