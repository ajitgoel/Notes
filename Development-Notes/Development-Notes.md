In mockito-based junit tests, ==@Mock annotation creates mocks and @InjectMocks creates actual objects and injects mocked dependencies into it==

I have a application whose unit tests work correctly. 
I am trying to move the application to use dependency injection instead of using `@AutoWired` annotation. 
After I make the change, some unit tests fail randomly(
    No changes have been made to the tests, just the dependency injection part of the application has been changed)
What am I missing?

Abreviated code:

    @Component
    public class S3Accessor {
        private AmazonS3 s3ClientAlphaBeta;
        private AmazonS3 s3ClientGammaProd;
        @Inject
        public S3Accessor(@Qualifier("s3ClientAlphaBeta") AmazonS3 s3ClientAlphaBeta,
                @Qualifier("s3ClientGammaProd") AmazonS3 s3ClientGammaProd) {
            this.s3ClientAlphaBeta = s3ClientAlphaBeta;
            this.s3ClientGammaProd = s3ClientGammaProd;
        }
public String getHtmlContent(final String deviceType, final String s3Key, final String region) {
        final String filePath = generateFilePath(deviceType.toLowerCase(Locale.ROOT), s3Key);
        AmazonS3 amazonS3 = s3ClientAlphaBeta;
        final String regionSpecificLegoBucket = S3BUCKET_NAME_BETA;
        final AmazonS3 regionSpecificAmazonS3 = amazonS3;
        return this.getHtmlContentFromS3(regionSpecificLegoBucket, filePath, regionSpecificAmazonS3);
    }

    private String getHtmlContentFromS3(final String bucketName, final String filePath, final AmazonS3 amazonS3) {
        String s3HtmlContent = amazonS3.getObjectAsString(bucketName, filePath);
        return wrapHtmlContentInDiv(s3HtmlContent);
    }
    
    public class S3AccessorTest {
    @InjectMocks
    private S3Accessor s3Accessor;
    @Spy
    @Qualifier("s3ClientAlphaBeta")
    private AmazonS3 s3ClientAlphaBeta;
    @Spy
    @Qualifier("s3ClientGammaProd")
    private AmazonS3 s3ClientGammaProd;
    private static final String TEST_VALID_STRING_DESKTOP = "<html><body>Lego Content DESKTOP</body></html>";
    private static final String TEST_VALID_WRAPPED_STRING_DESKTOP =
            PAINTERS_LEGO_OPENING_DIV + TEST_VALID_STRING_DESKTOP + PAINTERS_LEGO_CLOSING_DIV;
    private static final String TEST_VALID_S3_KEY = "/test/.1/main";
    private static final String SLASH = "/";
    static {
        AppConfig.destroy();
        AppConfig.initialize("TestApp",
                "TestGroup",
                new String[] { "--root=configuration/", "--domain=test", "--realm=Ramu" });
    }
    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        s3Accessor.setup();
    }
    @Test
    public void getHtmlContentForDesktop() {
        // Arrange
        when(s3ClientAlphaBeta.getObjectAsString(anyString(), eq(TEST_VALID_S3_KEY + SLASH + DESKTOP_VIEW)))
                .thenReturn(TEST_VALID_STRING_DESKTOP);
        // Act
        final String outputString = s3Accessor.getHtmlContent(DESKTOP, TEST_VALID_S3_KEY, US_ALPHA_BETA_REGION);
        // Assert
        assertEquals(TEST_VALID_WRAPPED_STRING_DESKTOP, outputString);
    }
    
    @Configuration
@ComponentScan("com.service.controller")
@Import({SmokeTestBeanConfiguration.class })
public class CustomRootConfig {
    private static final String NA_S3_SESSION_NAME = "S3Content";
    private static final int S3_SESSION_REFRESH_TIME = 3600;
    private static final String S3BUCKET_ARN_BETA = "arn:aws:iam::471963992020:role/ProdAccessForAccount";
    private static final String S3BUCKET_ARN_PROD = "arn:aws:iam::568948772290:role/ProdAccessForAccount";

    @Bean(name = "s3ClientAlphaBeta")
    @Singleton
    public AmazonS3 s3ClientAlphaBeta() {
        return AmazonS3ClientBuilder.standard()
                .withRegion(Regions.valueOf(US_ALPHA_BETA_REGION))
                .withCredentials(new STSAssumeRoleSessionCredentialsProvider
                        .Builder(S3BUCKET_ARN_BETA, NA_S3_SESSION_NAME)
                        .withRoleSessionDurationSeconds(S3_SESSION_REFRESH_TIME).build())
                .build();
    }
    
    @Bean(name = "s3ClientGammaProd")
    @Singleton
    public AmazonS3 s3ClientGammaProd() {
        return AmazonS3ClientBuilder.standard()
                .withRegion(Regions.valueOf(US_GAMMA_PROD_REGION))
                .withCredentials(new STSAssumeRoleSessionCredentialsProvider
                        .Builder(S3BUCKET_ARN_PROD, NA_S3_SESSION_NAME)
                        .withRoleSessionDurationSeconds(S3_SESSION_REFRESH_TIME).build())
                .build();
    }

https://stackoverflow.com/questions/4931323/whats-the-difference-between-getrequesturi-and-getpathinfo-methods-in-httpservl

```
http://30thh.loc:8480/app/test%3F/a%3F+b;jsessionid=S%3F+ID?p+1=c+d&p+2=e+f#a
Method              URL-Decoded Result           
----------------------------------------------------
getContextPath()        no      /app
getLocalAddr()                  127.0.0.1
getLocalName()                  30thh.loc
getLocalPort()                  8480
getMethod()                     GET
getPathInfo()           yes     /a?+b
getProtocol()                   HTTP/1.1
getQueryString()        no      p+1=c+d&p+2=e+f
getRequestedSessionId() no      S%3F+ID
getRequestURI()         no      /app/test%3F/a%3F+b;jsessionid=S+ID
getRequestURL()         no      http://30thh.loc:8480/app/test%3F/a%3F+b;jsessionid=S+ID
getScheme()                     http
getServerName()                 30thh.loc
getServerPort()                 8480
getServletPath()        yes     /test?
getParameterNames()     yes     [p 2, p 1]
getParameter("p 1")     yes     c d
```

----------

